; DESCRIPTION: Geometry OS program to draw a red rectangle.

; concentric.asm -- Draw 4 concentric rings from center (128,128)
;
; Intended output:
;   Ring 1 (r=100): blue   0x0000FF
;   Ring 2 (r=75):  red    0xFF0000
;   Ring 3 (r=50):  green  0x00FF00
;   Ring 4 (r=25):  yellow 0xFFFF00
;
; Actual output: Ring 3 is wrong color. Agent must diagnose why.

LDI r5, 128      ; center x
LDI r12, 128      ; center y

; Ring 1: radius 100, blue
LDI r2, 100
LDI r0, 0x0000FF
CIRCLE r5, r12, r2, r0

; Ring 2: radius 75, red
LDI r2, 75
LDI r0, 0xFF0000
CIRCLE r5, r12, r2, r0

; Ring 3: radius 50, SHOULD BE green (0x00FF00)
; Bug: color is computed by shifting instead of loading immediate.
; SHL 1 on 0x7F80 gives 0xFF00, not 0x00FF00.
LDI r2, 50
LDI r0, 0x7F80
LDI r14, 1
SHL r0, r14
CIRCLE r5, r12, r2, r0

; Ring 4: radius 25, yellow
LDI r2, 25
LDI r0, 0xFFFF00
CIRCLE r5, r12, r2, r0

HALT

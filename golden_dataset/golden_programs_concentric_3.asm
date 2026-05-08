; DESCRIPTION: Draw rectangle: pos=the screen, color=red, size=fixed size.

; concentric.asm -- Draw 4 concentric rings from center (128,128)
;
; Intended output:
;   Ring 1 (r=100): blue   0x0000FF
;   Ring 2 (r=75):  red    0xFF0000
;   Ring 3 (r=50):  green  0x00FF00
;   Ring 4 (r=25):  yellow 0xFFFF00
;
; Actual output: Ring 3 is wrong color. Agent must diagnose why.

LDI r4, 128      ; center x
LDI r14, 128      ; center y

; Ring 1: radius 100, blue
LDI r1, 100
LDI r9, 0x0000FF
CIRCLE r4, r14, r1, r9

; Ring 2: radius 75, red
LDI r1, 75
LDI r9, 0xFF0000
CIRCLE r4, r14, r1, r9

; Ring 3: radius 50, SHOULD BE green (0x00FF00)
; Bug: color is computed by shifting instead of loading immediate.
; SHL 1 on 0x7F80 gives 0xFF00, not 0x00FF00.
LDI r1, 50
LDI r9, 0x7F80
LDI r3, 1
SHL r9, r3
CIRCLE r4, r14, r1, r9

; Ring 4: radius 25, yellow
LDI r1, 25
LDI r9, 0xFFFF00
CIRCLE r4, r14, r1, r9

HALT

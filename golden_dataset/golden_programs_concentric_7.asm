; DESCRIPTION: The GeOS assembly code draws four concentric rings centered at (128, 128) with radii of 100, 75, 50, and 25 pixels, respectively. The intended colors for the rings are blue, red, green, and yellow; however, Ring 3 is incorrectly colored due to a bug in the color computation logic.

; concentric.asm -- Draw 4 concentric rings from center (128,128)
;
; Intended output:
;   Ring 1 (r=100): blue   0x0000FF
;   Ring 2 (r=75):  red    0xFF0000
;   Ring 3 (r=50):  green  0x00FF00
;   Ring 4 (r=25):  yellow 0xFFFF00
;
; Actual output: Ring 3 is wrong color. Agent must diagnose why.

LDI r7, 128      ; center x
LDI r3, 128      ; center y

; Ring 1: radius 100, blue
LDI r9, 100
LDI r8, 0x0000FF
CIRCLE r7, r3, r9, r8

; Ring 2: radius 75, red
LDI r9, 75
LDI r8, 0xFF0000
CIRCLE r7, r3, r9, r8

; Ring 3: radius 50, SHOULD BE green (0x00FF00)
; Bug: color is computed by shifting instead of loading immediate.
; SHL 1 on 0x7F80 gives 0xFF00, not 0x00FF00.
LDI r9, 50
LDI r8, 0x7F80
LDI r1, 1
SHL r8, r1
CIRCLE r7, r3, r9, r8

; Ring 4: radius 25, yellow
LDI r9, 25
LDI r8, 0xFFFF00
CIRCLE r7, r3, r9, r8

HALT

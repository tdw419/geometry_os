; DESCRIPTION: Draws a magenta line from (240, 37) to (20, 233).
; PLAN: r0=240(x1), r1=37(y1), r2=20(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 37
LDI r2, 20
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

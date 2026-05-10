; DESCRIPTION: Renders a magenta line between points (128, 200) and (428, 6).
; PLAN: r0=128(x1), r1=200(y1), r2=428(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 200
LDI r2, 428
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a magenta line between points (96, 110) and (23, 215).
; PLAN: r0=96(x1), r1=110(y1), r2=23(x2), r3=215(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 110
LDI r2, 23
LDI r3, 215
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a orange line segment connecting (65, 14) to (256, 8).
; PLAN: r0=65(x1), r1=14(y1), r2=256(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 14
LDI r2, 256
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

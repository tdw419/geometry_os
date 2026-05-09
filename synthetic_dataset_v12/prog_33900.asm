; DESCRIPTION: Renders a orange line between points (442, 144) and (135, 238).
; PLAN: r0=442(x1), r1=144(y1), r2=135(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 144
LDI r2, 135
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

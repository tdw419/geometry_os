; DESCRIPTION: Renders a orange line between points (89, 148) and (146, 128).
; PLAN: r0=89(x1), r1=148(y1), r2=146(x2), r3=128(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 148
LDI r2, 146
LDI r3, 128
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

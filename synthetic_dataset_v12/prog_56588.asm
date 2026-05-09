; DESCRIPTION: Renders a orange line between points (50, 179) and (455, 98).
; PLAN: r0=50(x1), r1=179(y1), r2=455(x2), r3=98(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 179
LDI r2, 455
LDI r3, 98
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

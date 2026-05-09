; DESCRIPTION: Renders a orange line between points (15, 168) and (228, 110).
; PLAN: r0=15(x1), r1=168(y1), r2=228(x2), r3=110(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 168
LDI r2, 228
LDI r3, 110
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

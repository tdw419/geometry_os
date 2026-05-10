; DESCRIPTION: Renders a orange line segment connecting (281, 193) to (336, 138).
; PLAN: r0=281(x1), r1=193(y1), r2=336(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 193
LDI r2, 336
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

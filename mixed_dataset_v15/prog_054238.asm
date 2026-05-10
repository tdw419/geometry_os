; DESCRIPTION: Renders a orange line between points (350, 108) and (507, 184).
; PLAN: r0=350(x1), r1=108(y1), r2=507(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 108
LDI r2, 507
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

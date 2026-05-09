; DESCRIPTION: Renders a orange line between points (196, 62) and (353, 95).
; PLAN: r0=196(x1), r1=62(y1), r2=353(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 62
LDI r2, 353
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

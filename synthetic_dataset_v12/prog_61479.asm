; DESCRIPTION: Renders a orange line between points (95, 151) and (54, 208).
; PLAN: r0=95(x1), r1=151(y1), r2=54(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 151
LDI r2, 54
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

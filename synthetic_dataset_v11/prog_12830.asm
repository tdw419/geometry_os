; DESCRIPTION: Renders a orange line between points (40, 68) and (210, 24).
; PLAN: r0=40(x1), r1=68(y1), r2=210(x2), r3=24(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 68
LDI r2, 210
LDI r3, 24
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

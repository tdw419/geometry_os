; DESCRIPTION: Renders a orange line between points (415, 91) and (85, 184).
; PLAN: r0=415(x1), r1=91(y1), r2=85(x2), r3=184(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 91
LDI r2, 85
LDI r3, 184
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

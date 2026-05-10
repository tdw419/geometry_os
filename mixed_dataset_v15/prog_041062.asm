; DESCRIPTION: Renders a orange line between points (415, 251) and (157, 133).
; PLAN: r0=415(x1), r1=251(y1), r2=157(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 251
LDI r2, 157
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT

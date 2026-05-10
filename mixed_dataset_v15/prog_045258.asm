; DESCRIPTION: Renders a white line between points (429, 3) and (438, 106).
; PLAN: r0=429(x1), r1=3(y1), r2=438(x2), r3=106(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 3
LDI r2, 438
LDI r3, 106
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

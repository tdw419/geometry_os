; DESCRIPTION: Renders a white line between points (195, 102) and (429, 28).
; PLAN: r0=195(x1), r1=102(y1), r2=429(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 102
LDI r2, 429
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white line between points (429, 236) and (135, 245).
; PLAN: r0=429(x1), r1=236(y1), r2=135(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 236
LDI r2, 135
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

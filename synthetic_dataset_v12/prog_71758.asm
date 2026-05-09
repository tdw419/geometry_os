; DESCRIPTION: Renders a white line between points (60, 137) and (429, 93).
; PLAN: r0=60(x1), r1=137(y1), r2=429(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 137
LDI r2, 429
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

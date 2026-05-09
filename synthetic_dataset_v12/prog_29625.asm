; DESCRIPTION: Renders a white box of size 109x79 starting at (363, 140).
; PLAN: r0=363(x), r1=140(y), r2=109(width), r3=79(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 140
LDI r2, 109
LDI r3, 79
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

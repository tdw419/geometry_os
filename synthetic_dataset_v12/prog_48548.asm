; DESCRIPTION: Renders a white box of size 87x81 starting at (302, 145).
; PLAN: r0=302(x), r1=145(y), r2=87(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 145
LDI r2, 87
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

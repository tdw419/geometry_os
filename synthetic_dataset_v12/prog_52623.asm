; DESCRIPTION: Renders a white box of size 93x84 starting at (363, 2).
; PLAN: r0=363(x), r1=2(y), r2=93(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 2
LDI r2, 93
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 40x31 starting at (9, 185).
; PLAN: r0=9(x), r1=185(y), r2=40(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 185
LDI r2, 40
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 71x14 starting at (40, 176).
; PLAN: r0=40(x), r1=176(y), r2=71(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 176
LDI r2, 71
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

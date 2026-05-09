; DESCRIPTION: Renders a white box of size 110x49 starting at (34, 61).
; PLAN: r0=34(x), r1=61(y), r2=110(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 61
LDI r2, 110
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

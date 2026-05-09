; DESCRIPTION: Renders a white box of size 32x13 starting at (34, 199).
; PLAN: r0=34(x), r1=199(y), r2=32(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 199
LDI r2, 32
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

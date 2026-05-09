; DESCRIPTION: Renders a white box of size 61x19 starting at (183, 176).
; PLAN: r0=183(x), r1=176(y), r2=61(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 176
LDI r2, 61
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

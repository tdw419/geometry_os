; DESCRIPTION: Renders a white box of size 116x14 starting at (204, 63).
; PLAN: r0=204(x), r1=63(y), r2=116(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 63
LDI r2, 116
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

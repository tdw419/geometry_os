; DESCRIPTION: Renders a white box of size 19x13 starting at (229, 116).
; PLAN: r0=229(x), r1=116(y), r2=19(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 116
LDI r2, 19
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

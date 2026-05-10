; DESCRIPTION: Renders a white box of size 116x30 starting at (172, 219).
; PLAN: r0=172(x), r1=219(y), r2=116(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 219
LDI r2, 116
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

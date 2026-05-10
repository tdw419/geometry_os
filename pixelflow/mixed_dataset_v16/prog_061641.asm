; DESCRIPTION: Renders a white box of size 64x31 starting at (81, 73).
; PLAN: r0=81(x), r1=73(y), r2=64(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 73
LDI r2, 64
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

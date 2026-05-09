; DESCRIPTION: Renders a white box of size 19x105 starting at (172, 128).
; PLAN: r0=172(x), r1=128(y), r2=19(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 128
LDI r2, 19
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

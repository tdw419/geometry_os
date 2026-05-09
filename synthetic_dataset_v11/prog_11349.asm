; DESCRIPTION: Renders a black box of size 77x107 starting at (173, 134).
; PLAN: r0=173(x), r1=134(y), r2=77(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 134
LDI r2, 77
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

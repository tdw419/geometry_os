; DESCRIPTION: Renders a black box of size 116x76 starting at (105, 115).
; PLAN: r0=105(x), r1=115(y), r2=116(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 115
LDI r2, 116
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

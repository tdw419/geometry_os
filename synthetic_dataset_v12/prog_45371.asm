; DESCRIPTION: Renders a black box of size 86x116 starting at (77, 73).
; PLAN: r0=77(x), r1=73(y), r2=86(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 73
LDI r2, 86
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

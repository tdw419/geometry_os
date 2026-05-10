; DESCRIPTION: Renders a black box of size 116x48 starting at (164, 114).
; PLAN: r0=164(x), r1=114(y), r2=116(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 114
LDI r2, 116
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

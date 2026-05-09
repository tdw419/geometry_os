; DESCRIPTION: Renders a black box of size 116x26 starting at (16, 21).
; PLAN: r0=16(x), r1=21(y), r2=116(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 21
LDI r2, 116
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

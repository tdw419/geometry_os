; DESCRIPTION: Renders a black box of size 77x34 starting at (119, 30).
; PLAN: r0=119(x), r1=30(y), r2=77(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 30
LDI r2, 77
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a black box of size 77x96 starting at (175, 24).
; PLAN: r0=175(x), r1=24(y), r2=77(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 24
LDI r2, 77
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

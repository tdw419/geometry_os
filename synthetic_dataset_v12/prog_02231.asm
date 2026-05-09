; DESCRIPTION: Renders a black box of size 14x78 starting at (286, 81).
; PLAN: r0=286(x), r1=81(y), r2=14(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 81
LDI r2, 14
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

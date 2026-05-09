; DESCRIPTION: Renders a black box of size 54x43 starting at (97, 194).
; PLAN: r0=97(x), r1=194(y), r2=54(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 194
LDI r2, 54
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

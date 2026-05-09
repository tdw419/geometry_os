; DESCRIPTION: Renders a black box of size 25x13 starting at (177, 232).
; PLAN: r0=177(x), r1=232(y), r2=25(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 232
LDI r2, 25
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

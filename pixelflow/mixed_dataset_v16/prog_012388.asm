; DESCRIPTION: Renders a black box of size 97x40 starting at (382, 155).
; PLAN: r0=382(x), r1=155(y), r2=97(width), r3=40(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 155
LDI r2, 97
LDI r3, 40
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

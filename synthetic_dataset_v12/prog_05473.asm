; DESCRIPTION: Renders a black box of size 36x34 starting at (296, 217).
; PLAN: r0=296(x), r1=217(y), r2=36(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 217
LDI r2, 36
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

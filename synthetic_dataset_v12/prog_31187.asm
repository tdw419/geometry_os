; DESCRIPTION: Renders a black box of size 60x113 starting at (266, 88).
; PLAN: r0=266(x), r1=88(y), r2=60(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 88
LDI r2, 60
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

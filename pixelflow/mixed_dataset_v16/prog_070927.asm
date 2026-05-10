; DESCRIPTION: Renders a black box of size 78x98 starting at (194, 113).
; PLAN: r0=194(x), r1=113(y), r2=78(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 113
LDI r2, 78
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

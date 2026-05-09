; DESCRIPTION: Renders a black box of size 25x113 starting at (194, 44).
; PLAN: r0=194(x), r1=44(y), r2=25(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 44
LDI r2, 25
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

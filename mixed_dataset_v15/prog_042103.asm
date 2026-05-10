; DESCRIPTION: Renders a black box of size 97x43 starting at (1, 50).
; PLAN: r0=1(x), r1=50(y), r2=97(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 50
LDI r2, 97
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

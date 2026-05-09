; DESCRIPTION: Renders a black box of size 119x43 starting at (46, 5).
; PLAN: r0=46(x), r1=5(y), r2=119(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 5
LDI r2, 119
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

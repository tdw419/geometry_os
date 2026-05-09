; DESCRIPTION: Renders a black box of size 98x66 starting at (55, 69).
; PLAN: r0=55(x), r1=69(y), r2=98(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 69
LDI r2, 98
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

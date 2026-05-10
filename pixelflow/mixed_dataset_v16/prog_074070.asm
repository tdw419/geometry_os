; DESCRIPTION: Renders a black box of size 69x73 starting at (438, 123).
; PLAN: r0=438(x), r1=123(y), r2=69(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 123
LDI r2, 69
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

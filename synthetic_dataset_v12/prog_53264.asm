; DESCRIPTION: Renders a black box of size 58x91 starting at (1, 121).
; PLAN: r0=1(x), r1=121(y), r2=58(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 121
LDI r2, 58
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

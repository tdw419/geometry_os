; DESCRIPTION: Renders a black box of size 58x74 starting at (108, 121).
; PLAN: r0=108(x), r1=121(y), r2=58(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 121
LDI r2, 58
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

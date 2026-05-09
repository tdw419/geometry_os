; DESCRIPTION: Renders a black box of size 118x76 starting at (111, 13).
; PLAN: r0=111(x), r1=13(y), r2=118(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 13
LDI r2, 118
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

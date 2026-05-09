; DESCRIPTION: Renders a black box of size 91x65 starting at (114, 119).
; PLAN: r0=114(x), r1=119(y), r2=91(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 119
LDI r2, 91
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

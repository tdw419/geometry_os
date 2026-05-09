; DESCRIPTION: Renders a black box of size 58x105 starting at (137, 68).
; PLAN: r0=137(x), r1=68(y), r2=58(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 68
LDI r2, 58
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

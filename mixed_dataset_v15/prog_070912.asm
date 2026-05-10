; DESCRIPTION: Renders a green box of size 49x65 starting at (122, 25).
; PLAN: r0=122(x), r1=25(y), r2=49(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 25
LDI r2, 49
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

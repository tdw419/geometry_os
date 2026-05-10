; DESCRIPTION: Renders a green box of size 46x58 starting at (359, 71).
; PLAN: r0=359(x), r1=71(y), r2=46(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 71
LDI r2, 46
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

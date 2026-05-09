; DESCRIPTION: Renders a green box of size 23x58 starting at (175, 15).
; PLAN: r0=175(x), r1=15(y), r2=23(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 15
LDI r2, 23
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

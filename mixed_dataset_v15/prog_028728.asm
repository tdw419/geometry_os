; DESCRIPTION: Draws a yellow rectangle at (273, 71) with width 94 and height 99.
; PLAN: r0=273(x), r1=71(y), r2=94(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 71
LDI r2, 94
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

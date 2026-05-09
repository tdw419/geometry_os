; DESCRIPTION: Draws a black rectangle at (211, 186) with width 108 and height 23.
; PLAN: r0=211(x), r1=186(y), r2=108(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 186
LDI r2, 108
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

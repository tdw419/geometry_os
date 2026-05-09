; DESCRIPTION: Draws a yellow rectangle at (272, 83) with width 65 and height 30.
; PLAN: r0=272(x), r1=83(y), r2=65(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 83
LDI r2, 65
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

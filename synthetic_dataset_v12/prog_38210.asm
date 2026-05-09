; DESCRIPTION: Draws a yellow rectangle at (243, 170) with width 27 and height 36.
; PLAN: r0=243(x), r1=170(y), r2=27(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 170
LDI r2, 27
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red rectangle at (17, 170) with width 63 and height 48.
; PLAN: r0=17(x), r1=170(y), r2=63(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 170
LDI r2, 63
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

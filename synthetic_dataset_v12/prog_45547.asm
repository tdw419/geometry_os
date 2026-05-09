; DESCRIPTION: Draws a green rectangle at (108, 60) with width 23 and height 20.
; PLAN: r0=108(x), r1=60(y), r2=23(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 60
LDI r2, 23
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

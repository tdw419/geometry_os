; DESCRIPTION: Draws a green rectangle at (196, 108) with width 31 and height 56.
; PLAN: r0=196(x), r1=108(y), r2=31(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 108
LDI r2, 31
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

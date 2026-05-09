; DESCRIPTION: Draws a green rectangle at (250, 2) with width 50 and height 56.
; PLAN: r0=250(x), r1=2(y), r2=50(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 2
LDI r2, 50
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

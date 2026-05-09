; DESCRIPTION: Draws a green rectangle at (135, 48) with width 65 and height 35.
; PLAN: r0=135(x), r1=48(y), r2=65(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 48
LDI r2, 65
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

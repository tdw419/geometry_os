; DESCRIPTION: Draws a green rectangle at (196, 153) with width 38 and height 65.
; PLAN: r0=196(x), r1=153(y), r2=38(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 153
LDI r2, 38
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

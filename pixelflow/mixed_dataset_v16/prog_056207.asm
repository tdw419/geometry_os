; DESCRIPTION: Draws a blue rectangle at (174, 208) with width 92 and height 29.
; PLAN: r0=174(x), r1=208(y), r2=92(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 208
LDI r2, 92
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

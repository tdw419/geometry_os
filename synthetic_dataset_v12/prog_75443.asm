; DESCRIPTION: Draws a blue rectangle at (225, 168) with width 80 and height 67.
; PLAN: r0=225(x), r1=168(y), r2=80(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 168
LDI r2, 80
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

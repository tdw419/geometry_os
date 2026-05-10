; DESCRIPTION: Draws a blue rectangle at (284, 68) with width 80 and height 36.
; PLAN: r0=284(x), r1=68(y), r2=80(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 68
LDI r2, 80
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

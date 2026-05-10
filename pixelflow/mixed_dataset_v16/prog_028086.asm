; DESCRIPTION: Draws a blue rectangle at (284, 90) with width 75 and height 78.
; PLAN: r0=284(x), r1=90(y), r2=75(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 90
LDI r2, 75
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

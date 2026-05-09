; DESCRIPTION: Draws a blue rectangle at (198, 85) with width 54 and height 50.
; PLAN: r0=198(x), r1=85(y), r2=54(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 85
LDI r2, 54
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

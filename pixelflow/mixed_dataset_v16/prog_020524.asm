; DESCRIPTION: Draws a blue rectangle at (50, 50) with size 80x60 then a magenta circle at (200, 100) with radius 40.
; PLAN: r0=50(x), r1=50(y), r2=80(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 50
LDI r2, 80
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

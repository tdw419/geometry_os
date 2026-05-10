; DESCRIPTION: Draws a blue rectangle at (360, 42) with width 104 and height 60.
; PLAN: r0=360(x), r1=42(y), r2=104(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 42
LDI r2, 104
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

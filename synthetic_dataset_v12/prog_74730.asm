; DESCRIPTION: Draws a blue rectangle at (32, 8) with width 48 and height 45.
; PLAN: r0=32(x), r1=8(y), r2=48(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 8
LDI r2, 48
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

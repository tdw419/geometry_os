; DESCRIPTION: Draws a blue rectangle at (129, 8) with width 50 and height 48.
; PLAN: r0=129(x), r1=8(y), r2=50(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 8
LDI r2, 50
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue rectangle at (75, 139) with width 109 and height 32.
; PLAN: r0=75(x), r1=139(y), r2=109(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 139
LDI r2, 109
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

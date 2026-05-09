; DESCRIPTION: Draws a blue rectangle at (75, 80) with width 68 and height 16.
; PLAN: r0=75(x), r1=80(y), r2=68(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 80
LDI r2, 68
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

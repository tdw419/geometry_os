; DESCRIPTION: Draws a blue rectangle at (93, 27) with width 47 and height 104.
; PLAN: r0=93(x), r1=27(y), r2=47(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 27
LDI r2, 47
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

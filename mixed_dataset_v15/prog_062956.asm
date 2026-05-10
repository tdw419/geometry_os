; DESCRIPTION: Draws a blue rectangle at (380, 74) with width 21 and height 96.
; PLAN: r0=380(x), r1=74(y), r2=21(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 74
LDI r2, 21
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

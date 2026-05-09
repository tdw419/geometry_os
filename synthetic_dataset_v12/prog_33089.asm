; DESCRIPTION: Draws a blue rectangle at (248, 61) with width 70 and height 39.
; PLAN: r0=248(x), r1=61(y), r2=70(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 61
LDI r2, 70
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue rectangle at (380, 48) with width 110 and height 108.
; PLAN: r0=380(x), r1=48(y), r2=110(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 48
LDI r2, 110
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

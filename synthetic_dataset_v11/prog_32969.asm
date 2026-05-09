; DESCRIPTION: Draws a blue rectangle at (90, 98) with width 30 and height 65.
; PLAN: r0=90(x), r1=98(y), r2=30(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 98
LDI r2, 30
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue rectangle at (82, 230) with width 45 and height 13.
; PLAN: r0=82(x), r1=230(y), r2=45(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 230
LDI r2, 45
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

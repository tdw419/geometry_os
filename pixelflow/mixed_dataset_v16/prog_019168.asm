; DESCRIPTION: Draws a blue rectangle at (215, 212) with width 47 and height 39.
; PLAN: r0=215(x), r1=212(y), r2=47(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 212
LDI r2, 47
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

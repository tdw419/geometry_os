; DESCRIPTION: Draws a blue rectangle at (215, 215) with width 52 and height 30.
; PLAN: r0=215(x), r1=215(y), r2=52(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 215
LDI r2, 52
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

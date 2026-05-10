; DESCRIPTION: Draws a blue rectangle at (215, 168) with width 11 and height 72.
; PLAN: r0=215(x), r1=168(y), r2=11(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 168
LDI r2, 11
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

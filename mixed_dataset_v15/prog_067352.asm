; DESCRIPTION: Draws a green rectangle at (215, 67) with width 120 and height 118.
; PLAN: r0=215(x), r1=67(y), r2=120(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 67
LDI r2, 120
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

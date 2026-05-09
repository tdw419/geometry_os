; DESCRIPTION: Draws a black rectangle at (65, 215) with width 72 and height 35.
; PLAN: r0=65(x), r1=215(y), r2=72(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 215
LDI r2, 72
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a purple rectangle at (95, 151) with width 104 and height 65.
; PLAN: r0=95(x), r1=151(y), r2=104(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 151
LDI r2, 104
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

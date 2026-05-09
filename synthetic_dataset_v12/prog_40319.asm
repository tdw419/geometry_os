; DESCRIPTION: Draws a purple rectangle at (342, 32) with width 120 and height 35.
; PLAN: r0=342(x), r1=32(y), r2=120(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 32
LDI r2, 120
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

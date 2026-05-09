; DESCRIPTION: Draws a purple rectangle at (330, 105) with width 16 and height 105.
; PLAN: r0=330(x), r1=105(y), r2=16(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 105
LDI r2, 16
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

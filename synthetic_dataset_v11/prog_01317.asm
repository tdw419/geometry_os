; DESCRIPTION: Draws a purple rectangle at (48, 48) with width 117 and height 57.
; PLAN: r0=48(x), r1=48(y), r2=117(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 48
LDI r2, 117
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

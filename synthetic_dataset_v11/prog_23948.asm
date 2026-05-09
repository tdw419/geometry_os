; DESCRIPTION: Draws a purple rectangle at (48, 111) with width 21 and height 31.
; PLAN: r0=48(x), r1=111(y), r2=21(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 111
LDI r2, 21
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

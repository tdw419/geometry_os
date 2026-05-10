; DESCRIPTION: Draws a purple rectangle at (485, 38) with width 10 and height 97.
; PLAN: r0=485(x), r1=38(y), r2=10(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 38
LDI r2, 10
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

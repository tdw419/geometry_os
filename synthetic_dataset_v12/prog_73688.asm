; DESCRIPTION: Draws a purple rectangle at (120, 124) with width 76 and height 117.
; PLAN: r0=120(x), r1=124(y), r2=76(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 124
LDI r2, 76
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

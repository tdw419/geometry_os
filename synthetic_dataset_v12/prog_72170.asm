; DESCRIPTION: Draws a purple rectangle at (293, 46) with width 116 and height 70.
; PLAN: r0=293(x), r1=46(y), r2=116(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 46
LDI r2, 116
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

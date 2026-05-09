; DESCRIPTION: Draws a purple rectangle at (437, 79) with width 27 and height 92.
; PLAN: r0=437(x), r1=79(y), r2=27(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 79
LDI r2, 27
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue rectangle at (380, 116) with width 28 and height 79.
; PLAN: r0=380(x), r1=116(y), r2=28(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 116
LDI r2, 28
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

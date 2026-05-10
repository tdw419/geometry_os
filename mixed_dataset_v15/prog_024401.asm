; DESCRIPTION: Draws a blue rectangle at (380, 79) with width 115 and height 109.
; PLAN: r0=380(x), r1=79(y), r2=115(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 79
LDI r2, 115
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

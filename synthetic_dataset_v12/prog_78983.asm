; DESCRIPTION: Draws a blue rectangle at (381, 71) with width 47 and height 98.
; PLAN: r0=381(x), r1=71(y), r2=47(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 71
LDI r2, 47
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

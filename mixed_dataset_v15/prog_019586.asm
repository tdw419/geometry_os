; DESCRIPTION: Draws a blue rectangle at (83, 65) with width 116 and height 93.
; PLAN: r0=83(x), r1=65(y), r2=116(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 65
LDI r2, 116
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

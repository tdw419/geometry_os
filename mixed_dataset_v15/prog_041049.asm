; DESCRIPTION: Draws a purple rectangle at (127, 152) with width 55 and height 77.
; PLAN: r0=127(x), r1=152(y), r2=55(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 152
LDI r2, 55
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

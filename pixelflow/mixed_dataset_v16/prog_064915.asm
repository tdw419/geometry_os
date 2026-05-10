; DESCRIPTION: Draws a blue rectangle at (69, 89) with width 47 and height 44.
; PLAN: r0=69(x), r1=89(y), r2=47(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 89
LDI r2, 47
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

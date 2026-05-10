; DESCRIPTION: Draws a blue rectangle at (341, 142) with width 98 and height 44.
; PLAN: r0=341(x), r1=142(y), r2=98(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 142
LDI r2, 98
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

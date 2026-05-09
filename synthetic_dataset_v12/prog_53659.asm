; DESCRIPTION: Draws a blue rectangle at (393, 2) with width 58 and height 44.
; PLAN: r0=393(x), r1=2(y), r2=58(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 2
LDI r2, 58
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

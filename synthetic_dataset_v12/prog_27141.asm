; DESCRIPTION: Draws a blue rectangle at (293, 100) with width 44 and height 18.
; PLAN: r0=293(x), r1=100(y), r2=44(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 100
LDI r2, 44
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

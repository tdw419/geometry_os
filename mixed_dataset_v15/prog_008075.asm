; DESCRIPTION: Draws a blue rectangle at (217, 201) with width 39 and height 24.
; PLAN: r0=217(x), r1=201(y), r2=39(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 201
LDI r2, 39
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

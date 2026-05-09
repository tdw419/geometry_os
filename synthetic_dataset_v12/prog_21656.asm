; DESCRIPTION: Draws a blue rectangle at (422, 56) with width 49 and height 33.
; PLAN: r0=422(x), r1=56(y), r2=49(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 56
LDI r2, 49
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

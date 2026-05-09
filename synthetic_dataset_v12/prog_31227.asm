; DESCRIPTION: Draws a magenta rectangle at (422, 72) with width 69 and height 10.
; PLAN: r0=422(x), r1=72(y), r2=69(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 72
LDI r2, 69
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

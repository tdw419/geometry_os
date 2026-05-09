; DESCRIPTION: Draws a blue rectangle at (312, 72) with width 16 and height 31.
; PLAN: r0=312(x), r1=72(y), r2=16(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 72
LDI r2, 16
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

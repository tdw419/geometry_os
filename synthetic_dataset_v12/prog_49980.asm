; DESCRIPTION: Draws a blue rectangle at (71, 172) with width 37 and height 32.
; PLAN: r0=71(x), r1=172(y), r2=37(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 172
LDI r2, 37
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

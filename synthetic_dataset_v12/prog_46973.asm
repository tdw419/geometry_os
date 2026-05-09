; DESCRIPTION: Draws a blue rectangle at (289, 98) with width 64 and height 99.
; PLAN: r0=289(x), r1=98(y), r2=64(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 98
LDI r2, 64
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

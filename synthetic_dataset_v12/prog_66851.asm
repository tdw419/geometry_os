; DESCRIPTION: Draws a blue rectangle at (326, 123) with width 71 and height 48.
; PLAN: r0=326(x), r1=123(y), r2=71(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 123
LDI r2, 71
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

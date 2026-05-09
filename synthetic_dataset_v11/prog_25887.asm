; DESCRIPTION: Draws a blue rectangle at (98, 193) with width 93 and height 45.
; PLAN: r0=98(x), r1=193(y), r2=93(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 193
LDI r2, 93
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

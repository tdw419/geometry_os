; DESCRIPTION: Draws a blue rectangle at (168, 225) with width 105 and height 24.
; PLAN: r0=168(x), r1=225(y), r2=105(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 225
LDI r2, 105
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue rectangle at (210, 134) with width 10 and height 98.
; PLAN: r0=210(x), r1=134(y), r2=10(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 134
LDI r2, 10
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

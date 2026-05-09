; DESCRIPTION: Draws a blue rectangle at (48, 134) with width 103 and height 71.
; PLAN: r0=48(x), r1=134(y), r2=103(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 134
LDI r2, 103
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

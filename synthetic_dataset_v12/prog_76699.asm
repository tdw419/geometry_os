; DESCRIPTION: Draws a blue rectangle at (303, 125) with width 71 and height 64.
; PLAN: r0=303(x), r1=125(y), r2=71(width), r3=64(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 125
LDI r2, 71
LDI r3, 64
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

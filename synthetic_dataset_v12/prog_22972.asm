; DESCRIPTION: Draws a blue rectangle at (77, 146) with width 60 and height 35.
; PLAN: r0=77(x), r1=146(y), r2=60(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 146
LDI r2, 60
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

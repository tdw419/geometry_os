; DESCRIPTION: Draws a blue rectangle at (275, 143) with width 112 and height 35.
; PLAN: r0=275(x), r1=143(y), r2=112(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 143
LDI r2, 112
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

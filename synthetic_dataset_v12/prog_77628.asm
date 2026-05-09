; DESCRIPTION: Draws a blue rectangle at (174, 144) with width 107 and height 21.
; PLAN: r0=174(x), r1=144(y), r2=107(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 144
LDI r2, 107
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a blue rectangle at (157, 193) with width 97 and height 57.
; PLAN: r0=157(x), r1=193(y), r2=97(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 193
LDI r2, 97
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

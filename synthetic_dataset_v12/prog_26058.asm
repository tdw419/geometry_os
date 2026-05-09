; DESCRIPTION: Draws a blue rectangle at (384, 159) with width 115 and height 21.
; PLAN: r0=384(x), r1=159(y), r2=115(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 159
LDI r2, 115
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

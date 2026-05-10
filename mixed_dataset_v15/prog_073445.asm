; DESCRIPTION: Draws a green rectangle at (150, 132) with width 38 and height 112.
; PLAN: r0=150(x), r1=132(y), r2=38(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 132
LDI r2, 38
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

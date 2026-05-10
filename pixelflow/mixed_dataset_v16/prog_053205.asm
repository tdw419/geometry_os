; DESCRIPTION: Draws a green rectangle at (173, 134) with width 89 and height 40.
; PLAN: r0=173(x), r1=134(y), r2=89(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 134
LDI r2, 89
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

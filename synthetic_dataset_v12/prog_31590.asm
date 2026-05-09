; DESCRIPTION: Draws a white rectangle at (95, 136) with width 94 and height 117.
; PLAN: r0=95(x), r1=136(y), r2=94(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 136
LDI r2, 94
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

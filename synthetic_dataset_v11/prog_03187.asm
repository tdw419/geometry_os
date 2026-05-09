; DESCRIPTION: Draws a white rectangle at (192, 117) with width 52 and height 74.
; PLAN: r0=192(x), r1=117(y), r2=52(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 117
LDI r2, 52
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

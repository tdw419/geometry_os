; DESCRIPTION: Draws a white rectangle at (17, 128) with width 118 and height 24.
; PLAN: r0=17(x), r1=128(y), r2=118(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 128
LDI r2, 118
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

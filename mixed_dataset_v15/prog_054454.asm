; DESCRIPTION: Draws a white rectangle at (173, 96) with width 24 and height 37.
; PLAN: r0=173(x), r1=96(y), r2=24(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 96
LDI r2, 24
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

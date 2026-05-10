; DESCRIPTION: Draws a white rectangle at (347, 151) with width 56 and height 52.
; PLAN: r0=347(x), r1=151(y), r2=56(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 151
LDI r2, 56
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

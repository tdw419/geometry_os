; DESCRIPTION: Draws a white rectangle at (165, 94) with width 49 and height 99.
; PLAN: r0=165(x), r1=94(y), r2=49(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 94
LDI r2, 49
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

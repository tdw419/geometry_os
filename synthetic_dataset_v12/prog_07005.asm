; DESCRIPTION: Draws a white rectangle at (206, 53) with width 25 and height 110.
; PLAN: r0=206(x), r1=53(y), r2=25(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 53
LDI r2, 25
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

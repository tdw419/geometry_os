; DESCRIPTION: Draws a white rectangle at (165, 50) with width 34 and height 94.
; PLAN: r0=165(x), r1=50(y), r2=34(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 50
LDI r2, 34
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

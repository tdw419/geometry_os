; DESCRIPTION: Draws a white rectangle at (32, 21) with width 34 and height 74.
; PLAN: r0=32(x), r1=21(y), r2=34(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 21
LDI r2, 34
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

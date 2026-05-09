; DESCRIPTION: Draws a white rectangle at (20, 10) with width 54 and height 73.
; PLAN: r0=20(x), r1=10(y), r2=54(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 10
LDI r2, 54
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

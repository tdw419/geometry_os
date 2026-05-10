; DESCRIPTION: Draws a red rectangle at (371, 105) with width 54 and height 34.
; PLAN: r0=371(x), r1=105(y), r2=54(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 105
LDI r2, 54
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

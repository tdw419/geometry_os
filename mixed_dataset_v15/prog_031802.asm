; DESCRIPTION: Draws a white rectangle at (328, 47) with width 62 and height 84.
; PLAN: r0=328(x), r1=47(y), r2=62(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 47
LDI r2, 62
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white rectangle at (255, 24) with width 54 and height 113.
; PLAN: r0=255(x), r1=24(y), r2=54(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 24
LDI r2, 54
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

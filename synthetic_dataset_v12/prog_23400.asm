; DESCRIPTION: Draws a white rectangle at (54, 59) with width 60 and height 113.
; PLAN: r0=54(x), r1=59(y), r2=60(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 59
LDI r2, 60
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

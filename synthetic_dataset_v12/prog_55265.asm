; DESCRIPTION: Draws a white rectangle at (416, 140) with width 78 and height 111.
; PLAN: r0=416(x), r1=140(y), r2=78(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 140
LDI r2, 78
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

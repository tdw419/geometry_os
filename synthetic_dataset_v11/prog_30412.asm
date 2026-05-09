; DESCRIPTION: Draws a white rectangle at (22, 54) with width 44 and height 111.
; PLAN: r0=22(x), r1=54(y), r2=44(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 54
LDI r2, 44
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

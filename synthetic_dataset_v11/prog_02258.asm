; DESCRIPTION: Draws a white rectangle at (20, 22) with width 59 and height 111.
; PLAN: r0=20(x), r1=22(y), r2=59(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 22
LDI r2, 59
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

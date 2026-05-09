; DESCRIPTION: Draws a white rectangle at (415, 9) with width 15 and height 111.
; PLAN: r0=415(x), r1=9(y), r2=15(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 9
LDI r2, 15
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

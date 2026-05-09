; DESCRIPTION: Draws a white rectangle at (59, 144) with width 111 and height 44.
; PLAN: r0=59(x), r1=144(y), r2=111(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 144
LDI r2, 111
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

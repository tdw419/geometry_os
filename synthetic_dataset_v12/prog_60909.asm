; DESCRIPTION: Draws a white rectangle at (381, 112) with width 59 and height 36.
; PLAN: r0=381(x), r1=112(y), r2=59(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 112
LDI r2, 59
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

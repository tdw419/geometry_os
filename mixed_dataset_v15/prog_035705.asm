; DESCRIPTION: Draws a white rectangle at (239, 59) with width 33 and height 73.
; PLAN: r0=239(x), r1=59(y), r2=33(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 59
LDI r2, 33
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

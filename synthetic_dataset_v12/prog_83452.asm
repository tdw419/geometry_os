; DESCRIPTION: Draws a white rectangle at (385, 59) with width 19 and height 14.
; PLAN: r0=385(x), r1=59(y), r2=19(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 59
LDI r2, 19
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

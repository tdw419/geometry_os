; DESCRIPTION: Draws a white rectangle at (321, 59) with width 69 and height 47.
; PLAN: r0=321(x), r1=59(y), r2=69(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 59
LDI r2, 69
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

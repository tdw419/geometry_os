; DESCRIPTION: Draws a green rectangle at (69, 151) with width 44 and height 33.
; PLAN: r0=69(x), r1=151(y), r2=44(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 151
LDI r2, 44
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

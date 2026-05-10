; DESCRIPTION: Draws a yellow rectangle at (83, 80) with width 29 and height 113.
; PLAN: r0=83(x), r1=80(y), r2=29(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 80
LDI r2, 29
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

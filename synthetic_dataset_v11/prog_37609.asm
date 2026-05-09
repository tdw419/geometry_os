; DESCRIPTION: Draws a green rectangle at (83, 34) with width 113 and height 44.
; PLAN: r0=83(x), r1=34(y), r2=113(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 34
LDI r2, 113
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

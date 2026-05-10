; DESCRIPTION: Draws a green rectangle at (286, 74) with width 33 and height 108.
; PLAN: r0=286(x), r1=74(y), r2=33(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 74
LDI r2, 33
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green rectangle at (313, 31) with width 47 and height 53.
; PLAN: r0=313(x), r1=31(y), r2=47(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 31
LDI r2, 47
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

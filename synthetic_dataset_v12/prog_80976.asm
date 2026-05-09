; DESCRIPTION: Draws a green rectangle at (55, 46) with width 39 and height 21.
; PLAN: r0=55(x), r1=46(y), r2=39(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 46
LDI r2, 39
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black rectangle at (108, 159) with width 77 and height 23.
; PLAN: r0=108(x), r1=159(y), r2=77(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 159
LDI r2, 77
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

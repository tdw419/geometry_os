; DESCRIPTION: Draws a yellow rectangle at (46, 199) with width 26 and height 47.
; PLAN: r0=46(x), r1=199(y), r2=26(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 199
LDI r2, 26
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

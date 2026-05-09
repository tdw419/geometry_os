; DESCRIPTION: Draws a yellow rectangle at (141, 141) with width 98 and height 46.
; PLAN: r0=141(x), r1=141(y), r2=98(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 141
LDI r2, 98
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow rectangle at (222, 190) with width 111 and height 91.
; PLAN: r0=222(x), r1=190(y), r2=111(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 190
LDI r2, 111
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

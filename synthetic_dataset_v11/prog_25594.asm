; DESCRIPTION: Draws a yellow rectangle at (52, 44) with width 39 and height 72.
; PLAN: r0=52(x), r1=44(y), r2=39(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 44
LDI r2, 39
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

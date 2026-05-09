; DESCRIPTION: Draws a yellow rectangle at (97, 117) with width 82 and height 44.
; PLAN: r0=97(x), r1=117(y), r2=82(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 117
LDI r2, 82
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

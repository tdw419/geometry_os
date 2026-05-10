; DESCRIPTION: Draws a yellow rectangle at (156, 73) with width 21 and height 44.
; PLAN: r0=156(x), r1=73(y), r2=21(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 73
LDI r2, 21
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

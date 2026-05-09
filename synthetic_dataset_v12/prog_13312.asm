; DESCRIPTION: Draws a yellow rectangle at (177, 93) with width 114 and height 108.
; PLAN: r0=177(x), r1=93(y), r2=114(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 93
LDI r2, 114
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

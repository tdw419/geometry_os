; DESCRIPTION: Draws a yellow rectangle at (86, 107) with width 62 and height 98.
; PLAN: r0=86(x), r1=107(y), r2=62(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 107
LDI r2, 62
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow rectangle at (91, 73) with width 107 and height 49.
; PLAN: r0=91(x), r1=73(y), r2=107(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 73
LDI r2, 107
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

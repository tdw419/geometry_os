; DESCRIPTION: Draws a yellow rectangle at (70, 23) with width 107 and height 36.
; PLAN: r0=70(x), r1=23(y), r2=107(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 23
LDI r2, 107
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

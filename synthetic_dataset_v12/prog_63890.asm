; DESCRIPTION: Draws a yellow rectangle at (212, 182) with width 70 and height 39.
; PLAN: r0=212(x), r1=182(y), r2=70(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 182
LDI r2, 70
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

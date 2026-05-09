; DESCRIPTION: Draws a yellow rectangle at (52, 182) with width 117 and height 14.
; PLAN: r0=52(x), r1=182(y), r2=117(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 182
LDI r2, 117
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

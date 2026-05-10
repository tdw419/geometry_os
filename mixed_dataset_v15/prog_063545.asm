; DESCRIPTION: Draws a yellow rectangle at (410, 182) with width 15 and height 40.
; PLAN: r0=410(x), r1=182(y), r2=15(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 182
LDI r2, 15
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

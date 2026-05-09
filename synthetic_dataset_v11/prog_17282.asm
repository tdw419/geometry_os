; DESCRIPTION: Draws a yellow rectangle at (176, 182) with width 56 and height 71.
; PLAN: r0=176(x), r1=182(y), r2=56(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 182
LDI r2, 56
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

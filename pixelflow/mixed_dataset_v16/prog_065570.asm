; DESCRIPTION: Draws a red rectangle at (385, 182) with width 56 and height 65.
; PLAN: r0=385(x), r1=182(y), r2=56(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 182
LDI r2, 56
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

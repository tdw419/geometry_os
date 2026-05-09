; DESCRIPTION: Draws a magenta rectangle at (131, 182) with width 22 and height 55.
; PLAN: r0=131(x), r1=182(y), r2=22(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 182
LDI r2, 22
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

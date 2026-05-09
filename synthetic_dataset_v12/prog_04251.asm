; DESCRIPTION: Draws a red rectangle at (50, 182) with width 87 and height 58.
; PLAN: r0=50(x), r1=182(y), r2=87(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 182
LDI r2, 87
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

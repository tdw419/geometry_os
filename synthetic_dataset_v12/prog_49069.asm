; DESCRIPTION: Draws a blue rectangle at (237, 182) with width 106 and height 68.
; PLAN: r0=237(x), r1=182(y), r2=106(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 182
LDI r2, 106
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

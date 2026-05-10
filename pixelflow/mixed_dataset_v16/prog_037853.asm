; DESCRIPTION: Draws a red rectangle at (118, 186) with width 28 and height 49.
; PLAN: r0=118(x), r1=186(y), r2=28(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 186
LDI r2, 28
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

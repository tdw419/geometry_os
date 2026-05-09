; DESCRIPTION: Draws a red rectangle at (230, 47) with width 14 and height 118.
; PLAN: r0=230(x), r1=47(y), r2=14(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 47
LDI r2, 14
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

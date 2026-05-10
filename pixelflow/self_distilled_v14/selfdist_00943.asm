; DESCRIPTION: Draws a red rectangle at (121, 190) with width 98 and height 35.
; PLAN: r0=121(x), r1=190(y), r2=98(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 190
LDI r2, 98
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

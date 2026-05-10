; DESCRIPTION: Draws a red rectangle at (96, 127) with width 55 and height 98.
; PLAN: r0=96(x), r1=127(y), r2=55(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 127
LDI r2, 55
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta rectangle at (437, 73) with width 65 and height 34.
; PLAN: r0=437(x), r1=73(y), r2=65(width), r3=34(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 73
LDI r2, 65
LDI r3, 34
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

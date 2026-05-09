; DESCRIPTION: Draws a magenta rectangle at (295, 26) with width 110 and height 72.
; PLAN: r0=295(x), r1=26(y), r2=110(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 26
LDI r2, 110
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

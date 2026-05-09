; DESCRIPTION: Draws a red rectangle at (205, 16) with width 57 and height 106.
; PLAN: r0=205(x), r1=16(y), r2=57(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 16
LDI r2, 57
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

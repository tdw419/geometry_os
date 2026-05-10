; DESCRIPTION: Draws a magenta rectangle at (186, 47) with width 88 and height 91.
; PLAN: r0=186(x), r1=47(y), r2=88(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 47
LDI r2, 88
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

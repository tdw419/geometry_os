; DESCRIPTION: Draws a red rectangle at (71, 54) with width 70 and height 115.
; PLAN: r0=71(x), r1=54(y), r2=70(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 54
LDI r2, 70
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

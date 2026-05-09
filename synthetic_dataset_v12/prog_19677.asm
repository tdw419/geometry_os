; DESCRIPTION: Draws a red rectangle at (152, 186) with width 20 and height 43.
; PLAN: r0=152(x), r1=186(y), r2=20(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 186
LDI r2, 20
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

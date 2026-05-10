; DESCRIPTION: Draws a red rectangle at (69, 186) with width 23 and height 54.
; PLAN: r0=69(x), r1=186(y), r2=23(width), r3=54(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 186
LDI r2, 23
LDI r3, 54
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

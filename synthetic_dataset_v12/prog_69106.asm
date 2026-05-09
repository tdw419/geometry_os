; DESCRIPTION: Draws a red rectangle at (45, 68) with width 54 and height 15.
; PLAN: r0=45(x), r1=68(y), r2=54(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 68
LDI r2, 54
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

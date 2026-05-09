; DESCRIPTION: Draws a red rectangle at (170, 87) with width 55 and height 23.
; PLAN: r0=170(x), r1=87(y), r2=55(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 87
LDI r2, 55
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

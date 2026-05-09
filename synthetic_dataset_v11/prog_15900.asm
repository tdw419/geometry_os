; DESCRIPTION: Draws a yellow rectangle at (85, 54) with width 104 and height 82.
; PLAN: r0=85(x), r1=54(y), r2=104(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 54
LDI r2, 104
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

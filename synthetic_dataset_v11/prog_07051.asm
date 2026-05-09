; DESCRIPTION: Draws a yellow rectangle at (205, 70) with width 44 and height 104.
; PLAN: r0=205(x), r1=70(y), r2=44(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 70
LDI r2, 44
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a yellow rectangle at (335, 104) with width 98 and height 57.
; PLAN: r0=335(x), r1=104(y), r2=98(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 104
LDI r2, 98
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

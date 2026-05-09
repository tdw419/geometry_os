; DESCRIPTION: Draws a black rectangle at (335, 23) with width 10 and height 104.
; PLAN: r0=335(x), r1=23(y), r2=10(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 23
LDI r2, 10
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

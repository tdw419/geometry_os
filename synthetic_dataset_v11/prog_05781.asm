; DESCRIPTION: Draws a green rectangle at (190, 31) with width 59 and height 104.
; PLAN: r0=190(x), r1=31(y), r2=59(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 31
LDI r2, 59
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

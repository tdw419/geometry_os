; DESCRIPTION: Draws a cyan rectangle at (141, 15) with width 59 and height 104.
; PLAN: r0=141(x), r1=15(y), r2=59(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 15
LDI r2, 59
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

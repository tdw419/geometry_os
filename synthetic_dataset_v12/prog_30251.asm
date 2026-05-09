; DESCRIPTION: Draws a cyan rectangle at (118, 124) with width 116 and height 104.
; PLAN: r0=118(x), r1=124(y), r2=116(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 124
LDI r2, 116
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan rectangle at (51, 57) with width 72 and height 104.
; PLAN: r0=51(x), r1=57(y), r2=72(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 57
LDI r2, 72
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

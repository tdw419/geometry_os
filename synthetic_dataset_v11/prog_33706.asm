; DESCRIPTION: Draws a cyan rectangle at (104, 151) with width 80 and height 89.
; PLAN: r0=104(x), r1=151(y), r2=80(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 151
LDI r2, 80
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

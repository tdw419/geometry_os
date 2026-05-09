; DESCRIPTION: Draws a cyan rectangle at (104, 80) with width 106 and height 64.
; PLAN: r0=104(x), r1=80(y), r2=106(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 80
LDI r2, 106
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

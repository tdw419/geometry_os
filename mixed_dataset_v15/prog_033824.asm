; DESCRIPTION: Draws a cyan rectangle at (99, 104) with width 96 and height 64.
; PLAN: r0=99(x), r1=104(y), r2=96(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 104
LDI r2, 96
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

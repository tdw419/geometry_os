; DESCRIPTION: Draws a cyan rectangle at (108, 89) with width 104 and height 16.
; PLAN: r0=108(x), r1=89(y), r2=104(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 89
LDI r2, 104
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

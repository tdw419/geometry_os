; DESCRIPTION: Draws a cyan rectangle at (231, 95) with width 104 and height 74.
; PLAN: r0=231(x), r1=95(y), r2=104(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 95
LDI r2, 104
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan rectangle at (312, 94) with width 13 and height 79.
; PLAN: r0=312(x), r1=94(y), r2=13(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 94
LDI r2, 13
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

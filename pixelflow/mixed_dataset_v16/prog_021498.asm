; DESCRIPTION: Draws a cyan rectangle at (173, 155) with width 89 and height 50.
; PLAN: r0=173(x), r1=155(y), r2=89(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 155
LDI r2, 89
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

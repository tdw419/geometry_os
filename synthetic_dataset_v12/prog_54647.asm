; DESCRIPTION: Draws a cyan rectangle at (180, 155) with width 72 and height 99.
; PLAN: r0=180(x), r1=155(y), r2=72(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 155
LDI r2, 72
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

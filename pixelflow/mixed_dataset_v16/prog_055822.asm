; DESCRIPTION: Draws a cyan rectangle at (299, 155) with width 34 and height 63.
; PLAN: r0=299(x), r1=155(y), r2=34(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 155
LDI r2, 34
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a cyan rectangle at (396, 72) with width 37 and height 106.
; PLAN: r0=396(x), r1=72(y), r2=37(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 72
LDI r2, 37
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

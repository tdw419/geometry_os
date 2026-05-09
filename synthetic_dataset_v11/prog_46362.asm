; DESCRIPTION: Draws a cyan rectangle at (155, 90) with width 52 and height 59.
; PLAN: r0=155(x), r1=90(y), r2=52(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 90
LDI r2, 52
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

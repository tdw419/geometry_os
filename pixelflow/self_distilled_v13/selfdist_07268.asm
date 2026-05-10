; DESCRIPTION: Draws a cyan rectangle at (122, 9) with width 36 and height 80.
; PLAN: r0=122(x), r1=9(y), r2=36(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 9
LDI r2, 36
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

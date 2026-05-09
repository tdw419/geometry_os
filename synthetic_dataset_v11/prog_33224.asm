; DESCRIPTION: Draws a cyan rectangle at (84, 121) with width 36 and height 91.
; PLAN: r0=84(x), r1=121(y), r2=36(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 121
LDI r2, 36
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

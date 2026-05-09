; DESCRIPTION: Draws a cyan rectangle at (80, 97) with width 117 and height 98.
; PLAN: r0=80(x), r1=97(y), r2=117(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 97
LDI r2, 117
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

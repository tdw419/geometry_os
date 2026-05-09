; DESCRIPTION: Draws a cyan rectangle at (117, 91) with width 118 and height 26.
; PLAN: r0=117(x), r1=91(y), r2=118(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 91
LDI r2, 118
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

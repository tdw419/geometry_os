; DESCRIPTION: Draws a cyan rectangle at (145, 91) with width 107 and height 102.
; PLAN: r0=145(x), r1=91(y), r2=107(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 91
LDI r2, 107
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

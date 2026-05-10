; DESCRIPTION: Draws a cyan rectangle at (205, 187) with width 110 and height 11.
; PLAN: r0=205(x), r1=187(y), r2=110(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 187
LDI r2, 110
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

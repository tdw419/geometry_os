; DESCRIPTION: Draws a cyan rectangle at (172, 187) with width 87 and height 54.
; PLAN: r0=172(x), r1=187(y), r2=87(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 187
LDI r2, 87
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

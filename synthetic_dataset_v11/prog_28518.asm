; DESCRIPTION: Draws a cyan rectangle at (130, 170) with width 87 and height 11.
; PLAN: r0=130(x), r1=170(y), r2=87(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 170
LDI r2, 87
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

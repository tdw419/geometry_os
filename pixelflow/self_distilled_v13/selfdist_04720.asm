; DESCRIPTION: Draws a cyan rectangle at (134, 170) with width 52 and height 50.
; PLAN: r0=134(x), r1=170(y), r2=52(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 170
LDI r2, 52
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

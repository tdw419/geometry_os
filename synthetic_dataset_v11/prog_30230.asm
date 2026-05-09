; DESCRIPTION: Draws a cyan rectangle at (103, 170) with width 21 and height 78.
; PLAN: r0=103(x), r1=170(y), r2=21(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 170
LDI r2, 21
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

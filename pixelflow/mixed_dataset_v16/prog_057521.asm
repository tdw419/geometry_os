; DESCRIPTION: Draws a cyan rectangle at (47, 170) with width 44 and height 27.
; PLAN: r0=47(x), r1=170(y), r2=44(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 170
LDI r2, 44
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

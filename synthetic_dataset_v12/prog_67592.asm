; DESCRIPTION: Draws a cyan rectangle at (10, 78) with width 44 and height 117.
; PLAN: r0=10(x), r1=78(y), r2=44(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 78
LDI r2, 44
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

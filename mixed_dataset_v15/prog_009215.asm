; DESCRIPTION: Draws a cyan rectangle at (20, 40) with width 78 and height 117.
; PLAN: r0=20(x), r1=40(y), r2=78(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 40
LDI r2, 78
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

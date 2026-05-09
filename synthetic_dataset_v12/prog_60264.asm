; DESCRIPTION: Draws a cyan rectangle at (78, 22) with width 91 and height 71.
; PLAN: r0=78(x), r1=22(y), r2=91(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 22
LDI r2, 91
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

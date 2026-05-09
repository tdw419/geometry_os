; DESCRIPTION: Draws a cyan rectangle at (205, 78) with width 65 and height 35.
; PLAN: r0=205(x), r1=78(y), r2=65(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 78
LDI r2, 65
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

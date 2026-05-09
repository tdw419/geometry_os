; DESCRIPTION: Draws a cyan rectangle at (130, 78) with width 68 and height 58.
; PLAN: r0=130(x), r1=78(y), r2=68(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 78
LDI r2, 68
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

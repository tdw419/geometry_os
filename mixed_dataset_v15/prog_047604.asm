; DESCRIPTION: Draws a cyan rectangle at (67, 144) with width 97 and height 78.
; PLAN: r0=67(x), r1=144(y), r2=97(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 144
LDI r2, 97
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

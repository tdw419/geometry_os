; DESCRIPTION: Draws a green rectangle at (67, 186) with width 63 and height 10.
; PLAN: r0=67(x), r1=186(y), r2=63(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 186
LDI r2, 63
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

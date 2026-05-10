; DESCRIPTION: Draws a green rectangle at (218, 174) with width 66 and height 78.
; PLAN: r0=218(x), r1=174(y), r2=66(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 174
LDI r2, 66
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

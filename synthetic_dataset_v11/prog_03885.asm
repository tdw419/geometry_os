; DESCRIPTION: Draws a green rectangle at (65, 53) with width 10 and height 78.
; PLAN: r0=65(x), r1=53(y), r2=10(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 53
LDI r2, 10
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

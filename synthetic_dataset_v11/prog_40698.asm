; DESCRIPTION: Draws a red rectangle at (119, 117) with width 63 and height 91.
; PLAN: r0=119(x), r1=117(y), r2=63(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 117
LDI r2, 63
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

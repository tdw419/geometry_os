; DESCRIPTION: Draws a red rectangle at (71, 91) with width 63 and height 69.
; PLAN: r0=71(x), r1=91(y), r2=63(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 91
LDI r2, 63
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a red rectangle at (3, 91) with width 36 and height 47.
; PLAN: r0=3(x), r1=91(y), r2=36(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 91
LDI r2, 36
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

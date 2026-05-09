; DESCRIPTION: Draws a red rectangle at (91, 40) with width 52 and height 81.
; PLAN: r0=91(x), r1=40(y), r2=52(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 40
LDI r2, 52
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

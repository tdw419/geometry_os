; DESCRIPTION: Draws a red rectangle at (91, 178) with width 34 and height 52.
; PLAN: r0=91(x), r1=178(y), r2=34(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 178
LDI r2, 34
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

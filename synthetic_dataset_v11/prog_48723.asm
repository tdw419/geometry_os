; DESCRIPTION: Composite: . Then Draws a red rectangle at (63, 87) with width 66 and height 29. Then Draws a orange circle centered at (86, 167) with radius 73.
; PLAN: r0=63(x), r1=87(y), r2=66(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=86(x), r1=167(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red rectangle at (63, 87) with width 66 and height 29.
; PLAN: r0=63(x), r1=87(y), r2=66(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 87
LDI r2, 66
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange circle centered at (86, 167) with radius 73.
; PLAN: r0=86(x), r1=167(y), r2=73(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 167
LDI r2, 73
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT

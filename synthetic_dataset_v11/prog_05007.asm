; DESCRIPTION: Draws a red rectangle at (66, 159) with width 75 and height 44.
; PLAN: r0=66(x), r1=159(y), r2=75(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 159
LDI r2, 75
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

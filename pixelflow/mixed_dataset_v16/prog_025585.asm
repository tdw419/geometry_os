; DESCRIPTION: Draws a red rectangle at (66, 166) with width 90 and height 44.
; PLAN: r0=66(x), r1=166(y), r2=90(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 166
LDI r2, 90
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

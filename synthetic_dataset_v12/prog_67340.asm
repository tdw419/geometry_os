; DESCRIPTION: Draws a orange rectangle at (246, 57) with width 45 and height 98.
; PLAN: r0=246(x), r1=57(y), r2=45(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 57
LDI r2, 45
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

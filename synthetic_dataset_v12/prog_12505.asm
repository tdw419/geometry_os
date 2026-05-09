; DESCRIPTION: Draws a orange rectangle at (18, 190) with width 44 and height 35.
; PLAN: r0=18(x), r1=190(y), r2=44(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 190
LDI r2, 44
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

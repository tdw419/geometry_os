; DESCRIPTION: Draws a orange rectangle at (309, 190) with width 93 and height 35.
; PLAN: r0=309(x), r1=190(y), r2=93(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 190
LDI r2, 93
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

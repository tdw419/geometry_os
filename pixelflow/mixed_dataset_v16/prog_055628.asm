; DESCRIPTION: Draws a orange rectangle at (273, 183) with width 27 and height 98.
; PLAN: r0=273(x), r1=183(y), r2=27(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 183
LDI r2, 27
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

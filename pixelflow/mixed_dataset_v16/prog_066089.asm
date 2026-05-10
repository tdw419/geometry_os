; DESCRIPTION: Draws a orange rectangle at (265, 215) with width 97 and height 23.
; PLAN: r0=265(x), r1=215(y), r2=97(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 215
LDI r2, 97
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

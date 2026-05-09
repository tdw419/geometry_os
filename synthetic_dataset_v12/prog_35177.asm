; DESCRIPTION: Draws a orange rectangle at (272, 43) with width 109 and height 18.
; PLAN: r0=272(x), r1=43(y), r2=109(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 43
LDI r2, 109
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

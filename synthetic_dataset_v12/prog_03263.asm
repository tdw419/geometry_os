; DESCRIPTION: Draws a orange rectangle at (29, 241) with width 27 and height 13.
; PLAN: r0=29(x), r1=241(y), r2=27(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 241
LDI r2, 27
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

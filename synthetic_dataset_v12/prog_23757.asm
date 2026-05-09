; DESCRIPTION: Draws a orange rectangle at (19, 201) with width 46 and height 42.
; PLAN: r0=19(x), r1=201(y), r2=46(width), r3=42(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 201
LDI r2, 46
LDI r3, 42
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

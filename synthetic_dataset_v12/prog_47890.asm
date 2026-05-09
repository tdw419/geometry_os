; DESCRIPTION: Draws a orange rectangle at (309, 138) with width 103 and height 46.
; PLAN: r0=309(x), r1=138(y), r2=103(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 138
LDI r2, 103
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

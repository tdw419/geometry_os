; DESCRIPTION: Draws a orange rectangle at (138, 107) with width 91 and height 99.
; PLAN: r0=138(x), r1=107(y), r2=91(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 107
LDI r2, 91
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

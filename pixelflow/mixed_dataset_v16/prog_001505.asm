; DESCRIPTION: Draws a orange rectangle at (153, 107) with width 46 and height 26.
; PLAN: r0=153(x), r1=107(y), r2=46(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 107
LDI r2, 46
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

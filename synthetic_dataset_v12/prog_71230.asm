; DESCRIPTION: Draws a orange rectangle at (399, 107) with width 38 and height 58.
; PLAN: r0=399(x), r1=107(y), r2=38(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 107
LDI r2, 38
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

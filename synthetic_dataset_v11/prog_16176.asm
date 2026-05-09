; DESCRIPTION: Draws a orange rectangle at (4, 23) with width 44 and height 72.
; PLAN: r0=4(x), r1=23(y), r2=44(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 23
LDI r2, 44
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (444, 207) with width 30 and height 33.
; PLAN: r0=444(x), r1=207(y), r2=30(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 207
LDI r2, 30
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

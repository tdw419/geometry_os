; DESCRIPTION: Draws a orange rectangle at (72, 46) with width 33 and height 97.
; PLAN: r0=72(x), r1=46(y), r2=33(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 46
LDI r2, 33
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

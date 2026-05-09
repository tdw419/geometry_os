; DESCRIPTION: Draws a orange rectangle at (104, 100) with width 46 and height 72.
; PLAN: r0=104(x), r1=100(y), r2=46(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 100
LDI r2, 46
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

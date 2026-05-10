; DESCRIPTION: Draws a orange rectangle at (114, 44) with width 76 and height 104.
; PLAN: r0=114(x), r1=44(y), r2=76(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 44
LDI r2, 76
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

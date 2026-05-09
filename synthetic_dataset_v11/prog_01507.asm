; DESCRIPTION: Draws a orange rectangle at (135, 132) with width 33 and height 104.
; PLAN: r0=135(x), r1=132(y), r2=33(width), r3=104(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 132
LDI r2, 33
LDI r3, 104
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

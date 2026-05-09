; DESCRIPTION: Draws a orange rectangle at (172, 44) with width 22 and height 48.
; PLAN: r0=172(x), r1=44(y), r2=22(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 44
LDI r2, 22
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

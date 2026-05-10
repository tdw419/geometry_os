; DESCRIPTION: Draws a orange rectangle at (260, 23) with width 44 and height 45.
; PLAN: r0=260(x), r1=23(y), r2=44(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 23
LDI r2, 44
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

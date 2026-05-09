; DESCRIPTION: Draws a orange rectangle at (21, 99) with width 14 and height 45.
; PLAN: r0=21(x), r1=99(y), r2=14(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 99
LDI r2, 14
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

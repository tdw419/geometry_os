; DESCRIPTION: Draws a orange rectangle at (99, 168) with width 44 and height 22.
; PLAN: r0=99(x), r1=168(y), r2=44(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 168
LDI r2, 44
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

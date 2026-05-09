; DESCRIPTION: Draws a orange rectangle at (58, 89) with width 59 and height 100.
; PLAN: r0=58(x), r1=89(y), r2=59(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 89
LDI r2, 59
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

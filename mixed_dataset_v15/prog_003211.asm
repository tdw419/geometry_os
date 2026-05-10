; DESCRIPTION: Draws a orange rectangle at (254, 82) with width 99 and height 16.
; PLAN: r0=254(x), r1=82(y), r2=99(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 82
LDI r2, 99
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

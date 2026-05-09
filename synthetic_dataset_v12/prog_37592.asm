; DESCRIPTION: Draws a orange rectangle at (32, 149) with width 38 and height 100.
; PLAN: r0=32(x), r1=149(y), r2=38(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 149
LDI r2, 38
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

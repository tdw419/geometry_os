; DESCRIPTION: Draws a orange rectangle at (238, 128) with width 55 and height 89.
; PLAN: r0=238(x), r1=128(y), r2=55(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 128
LDI r2, 55
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (83, 176) with width 64 and height 102.
; PLAN: r0=83(x), r1=176(y), r2=64(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 176
LDI r2, 64
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

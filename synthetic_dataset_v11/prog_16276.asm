; DESCRIPTION: Draws a orange rectangle at (131, 16) with width 58 and height 17.
; PLAN: r0=131(x), r1=16(y), r2=58(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 16
LDI r2, 58
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (131, 177) with width 56 and height 18.
; PLAN: r0=131(x), r1=177(y), r2=56(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 177
LDI r2, 56
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

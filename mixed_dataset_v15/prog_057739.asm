; DESCRIPTION: Draws a orange rectangle at (52, 153) with width 76 and height 86.
; PLAN: r0=52(x), r1=153(y), r2=76(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 153
LDI r2, 76
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (281, 53) with width 56 and height 17.
; PLAN: r0=281(x), r1=53(y), r2=56(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 53
LDI r2, 56
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

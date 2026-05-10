; DESCRIPTION: Draws a orange rectangle at (61, 194) with width 87 and height 38.
; PLAN: r0=61(x), r1=194(y), r2=87(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 194
LDI r2, 87
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (385, 61) with width 14 and height 12.
; PLAN: r0=385(x), r1=61(y), r2=14(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 61
LDI r2, 14
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

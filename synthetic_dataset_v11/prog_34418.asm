; DESCRIPTION: Draws a orange rectangle at (89, 61) with width 74 and height 72.
; PLAN: r0=89(x), r1=61(y), r2=74(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 61
LDI r2, 74
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

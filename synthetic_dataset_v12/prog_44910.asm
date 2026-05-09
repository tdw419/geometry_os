; DESCRIPTION: Draws a orange rectangle at (70, 23) with width 120 and height 72.
; PLAN: r0=70(x), r1=23(y), r2=120(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 23
LDI r2, 120
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

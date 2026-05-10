; DESCRIPTION: Draws a orange rectangle at (13, 134) with width 120 and height 28.
; PLAN: r0=13(x), r1=134(y), r2=120(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 134
LDI r2, 120
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

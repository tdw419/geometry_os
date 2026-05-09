; DESCRIPTION: Draws a orange rectangle at (341, 5) with width 23 and height 60.
; PLAN: r0=341(x), r1=5(y), r2=23(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 5
LDI r2, 23
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

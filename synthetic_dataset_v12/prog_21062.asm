; DESCRIPTION: Draws a orange rectangle at (166, 40) with width 60 and height 32.
; PLAN: r0=166(x), r1=40(y), r2=60(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 40
LDI r2, 60
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

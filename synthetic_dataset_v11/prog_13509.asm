; DESCRIPTION: Draws a orange rectangle at (79, 140) with width 86 and height 40.
; PLAN: r0=79(x), r1=140(y), r2=86(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 140
LDI r2, 86
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

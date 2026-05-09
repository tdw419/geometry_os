; DESCRIPTION: Draws a orange rectangle at (8, 98) with width 75 and height 103.
; PLAN: r0=8(x), r1=98(y), r2=75(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 98
LDI r2, 75
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

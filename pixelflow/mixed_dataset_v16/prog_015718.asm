; DESCRIPTION: Draws a orange rectangle at (164, 90) with width 60 and height 87.
; PLAN: r0=164(x), r1=90(y), r2=60(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 90
LDI r2, 60
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

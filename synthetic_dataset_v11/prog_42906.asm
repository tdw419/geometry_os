; DESCRIPTION: Draws a orange rectangle at (193, 19) with width 24 and height 90.
; PLAN: r0=193(x), r1=19(y), r2=24(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 19
LDI r2, 24
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

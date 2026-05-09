; DESCRIPTION: Draws a orange rectangle at (103, 90) with width 39 and height 10.
; PLAN: r0=103(x), r1=90(y), r2=39(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 90
LDI r2, 39
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

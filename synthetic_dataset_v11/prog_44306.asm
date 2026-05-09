; DESCRIPTION: Draws a orange rectangle at (179, 59) with width 10 and height 66.
; PLAN: r0=179(x), r1=59(y), r2=10(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 59
LDI r2, 10
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

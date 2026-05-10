; DESCRIPTION: Draws a orange rectangle at (70, 48) with width 81 and height 25.
; PLAN: r0=70(x), r1=48(y), r2=81(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 48
LDI r2, 81
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (96, 32) with width 25 and height 103.
; PLAN: r0=96(x), r1=32(y), r2=25(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 32
LDI r2, 25
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a orange rectangle at (103, 64) with width 80 and height 101.
; PLAN: r0=103(x), r1=64(y), r2=80(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 64
LDI r2, 80
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

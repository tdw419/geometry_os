; DESCRIPTION: Draws a orange rectangle at (181, 40) with width 120 and height 16.
; PLAN: r0=181(x), r1=40(y), r2=120(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 40
LDI r2, 120
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

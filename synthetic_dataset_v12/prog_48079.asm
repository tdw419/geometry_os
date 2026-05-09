; DESCRIPTION: Draws a orange rectangle at (412, 8) with width 10 and height 45.
; PLAN: r0=412(x), r1=8(y), r2=10(width), r3=45(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 8
LDI r2, 10
LDI r3, 45
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

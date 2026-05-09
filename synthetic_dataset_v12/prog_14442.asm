; DESCRIPTION: Draws a orange rectangle at (234, 196) with width 103 and height 22.
; PLAN: r0=234(x), r1=196(y), r2=103(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 196
LDI r2, 103
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

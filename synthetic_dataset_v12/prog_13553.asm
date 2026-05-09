; DESCRIPTION: Draws a orange rectangle at (123, 56) with width 64 and height 57.
; PLAN: r0=123(x), r1=56(y), r2=64(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 56
LDI r2, 64
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

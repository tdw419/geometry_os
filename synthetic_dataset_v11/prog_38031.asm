; DESCRIPTION: Draws a orange rectangle at (28, 48) with width 32 and height 63.
; PLAN: r0=28(x), r1=48(y), r2=32(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 48
LDI r2, 32
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

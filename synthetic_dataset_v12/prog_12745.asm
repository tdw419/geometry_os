; DESCRIPTION: Draws a orange rectangle at (250, 86) with width 57 and height 64.
; PLAN: r0=250(x), r1=86(y), r2=57(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 86
LDI r2, 57
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

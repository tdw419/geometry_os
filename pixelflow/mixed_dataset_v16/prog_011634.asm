; DESCRIPTION: Draws a white rectangle at (399, 64) with width 63 and height 11.
; PLAN: r0=399(x), r1=64(y), r2=63(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 64
LDI r2, 63
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

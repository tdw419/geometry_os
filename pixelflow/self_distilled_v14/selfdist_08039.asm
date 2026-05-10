; DESCRIPTION: Draws a orange rectangle at (249, 64) with width 92 and height 86.
; PLAN: r0=249(x), r1=64(y), r2=92(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 64
LDI r2, 92
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

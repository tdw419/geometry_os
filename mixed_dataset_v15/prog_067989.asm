; DESCRIPTION: Draws a orange rectangle at (383, 112) with width 64 and height 79.
; PLAN: r0=383(x), r1=112(y), r2=64(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 112
LDI r2, 64
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

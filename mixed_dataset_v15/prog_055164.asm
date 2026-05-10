; DESCRIPTION: Draws a orange rectangle at (251, 128) with width 77 and height 31.
; PLAN: r0=251(x), r1=128(y), r2=77(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 128
LDI r2, 77
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

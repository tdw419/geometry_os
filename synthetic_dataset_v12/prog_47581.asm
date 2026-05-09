; DESCRIPTION: Draws a orange rectangle at (126, 31) with width 57 and height 116.
; PLAN: r0=126(x), r1=31(y), r2=57(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 31
LDI r2, 57
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

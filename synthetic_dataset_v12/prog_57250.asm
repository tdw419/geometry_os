; DESCRIPTION: Draws a red rectangle at (128, 77) with width 36 and height 116.
; PLAN: r0=128(x), r1=77(y), r2=36(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 77
LDI r2, 36
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

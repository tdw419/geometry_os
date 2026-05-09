; DESCRIPTION: Draws a red rectangle at (245, 96) with width 116 and height 22.
; PLAN: r0=245(x), r1=96(y), r2=116(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 96
LDI r2, 116
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

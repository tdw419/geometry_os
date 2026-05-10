; DESCRIPTION: Draws a orange rectangle at (237, 116) with width 95 and height 112.
; PLAN: r0=237(x), r1=116(y), r2=95(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 116
LDI r2, 95
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

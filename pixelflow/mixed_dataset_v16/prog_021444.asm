; DESCRIPTION: Draws a red rectangle at (1, 4) with width 116 and height 48.
; PLAN: r0=1(x), r1=4(y), r2=116(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 4
LDI r2, 116
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

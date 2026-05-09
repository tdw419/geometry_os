; DESCRIPTION: Draws a red rectangle at (135, 90) with width 96 and height 61.
; PLAN: r0=135(x), r1=90(y), r2=96(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 90
LDI r2, 96
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

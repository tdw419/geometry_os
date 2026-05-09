; DESCRIPTION: Draws a red rectangle at (189, 6) with width 20 and height 96.
; PLAN: r0=189(x), r1=6(y), r2=20(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 6
LDI r2, 20
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

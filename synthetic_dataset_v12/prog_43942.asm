; DESCRIPTION: Draws a red rectangle at (12, 77) with width 10 and height 36.
; PLAN: r0=12(x), r1=77(y), r2=10(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 77
LDI r2, 10
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

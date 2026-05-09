; DESCRIPTION: Draws a red rectangle at (14, 7) with width 52 and height 52.
; PLAN: r0=14(x), r1=7(y), r2=52(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 7
LDI r2, 52
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

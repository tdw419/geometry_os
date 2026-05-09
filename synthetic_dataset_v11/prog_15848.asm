; DESCRIPTION: Draws a red rectangle at (36, 124) with width 90 and height 105.
; PLAN: r0=36(x), r1=124(y), r2=90(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 124
LDI r2, 90
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

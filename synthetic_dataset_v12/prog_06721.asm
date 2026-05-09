; DESCRIPTION: Draws a red rectangle at (423, 112) with width 20 and height 79.
; PLAN: r0=423(x), r1=112(y), r2=20(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 112
LDI r2, 20
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

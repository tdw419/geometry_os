; DESCRIPTION: Draws a red rectangle at (175, 33) with width 112 and height 79.
; PLAN: r0=175(x), r1=33(y), r2=112(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 33
LDI r2, 112
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

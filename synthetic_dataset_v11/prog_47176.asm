; DESCRIPTION: Draws a white rectangle at (73, 145) with width 34 and height 82.
; PLAN: r0=73(x), r1=145(y), r2=34(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 145
LDI r2, 34
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white rectangle at (182, 72) with width 112 and height 99.
; PLAN: r0=182(x), r1=72(y), r2=112(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 72
LDI r2, 112
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

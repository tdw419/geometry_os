; DESCRIPTION: Draws a white rectangle at (271, 7) with width 112 and height 106.
; PLAN: r0=271(x), r1=7(y), r2=112(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 7
LDI r2, 112
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

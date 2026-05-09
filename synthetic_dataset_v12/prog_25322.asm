; DESCRIPTION: Draws a white rectangle at (335, 56) with width 109 and height 19.
; PLAN: r0=335(x), r1=56(y), r2=109(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 56
LDI r2, 109
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

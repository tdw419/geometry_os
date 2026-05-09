; DESCRIPTION: Draws a white rectangle at (400, 160) with width 61 and height 66.
; PLAN: r0=400(x), r1=160(y), r2=61(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 160
LDI r2, 61
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

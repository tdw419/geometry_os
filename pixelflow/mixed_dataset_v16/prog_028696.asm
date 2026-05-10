; DESCRIPTION: Draws a white rectangle at (308, 92) with width 106 and height 17.
; PLAN: r0=308(x), r1=92(y), r2=106(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 92
LDI r2, 106
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

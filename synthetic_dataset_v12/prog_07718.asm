; DESCRIPTION: Draws a white rectangle at (308, 81) with width 118 and height 111.
; PLAN: r0=308(x), r1=81(y), r2=118(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 81
LDI r2, 118
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

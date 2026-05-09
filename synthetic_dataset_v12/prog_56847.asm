; DESCRIPTION: Draws a white rectangle at (308, 139) with width 96 and height 35.
; PLAN: r0=308(x), r1=139(y), r2=96(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 139
LDI r2, 96
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

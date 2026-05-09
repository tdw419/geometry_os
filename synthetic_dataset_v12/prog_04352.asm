; DESCRIPTION: Draws a white rectangle at (336, 13) with width 89 and height 111.
; PLAN: r0=336(x), r1=13(y), r2=89(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 13
LDI r2, 89
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

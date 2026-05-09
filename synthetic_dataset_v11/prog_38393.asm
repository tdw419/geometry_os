; DESCRIPTION: Draws a white rectangle at (12, 26) with width 111 and height 89.
; PLAN: r0=12(x), r1=26(y), r2=111(width), r3=89(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 26
LDI r2, 111
LDI r3, 89
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

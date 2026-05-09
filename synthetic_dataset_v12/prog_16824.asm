; DESCRIPTION: Draws a white rectangle at (389, 141) with width 40 and height 73.
; PLAN: r0=389(x), r1=141(y), r2=40(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 141
LDI r2, 40
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

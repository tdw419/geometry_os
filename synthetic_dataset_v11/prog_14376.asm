; DESCRIPTION: Draws a white rectangle at (4, 80) with width 55 and height 71.
; PLAN: r0=4(x), r1=80(y), r2=55(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 80
LDI r2, 55
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

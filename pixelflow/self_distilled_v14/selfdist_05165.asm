; DESCRIPTION: Draws a white rectangle at (314, 138) with width 72 and height 27.
; PLAN: r0=314(x), r1=138(y), r2=72(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 138
LDI r2, 72
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white rectangle at (314, 59) with width 71 and height 96.
; PLAN: r0=314(x), r1=59(y), r2=71(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 59
LDI r2, 71
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

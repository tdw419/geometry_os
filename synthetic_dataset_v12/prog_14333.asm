; DESCRIPTION: Draws a white rectangle at (91, 153) with width 14 and height 92.
; PLAN: r0=91(x), r1=153(y), r2=14(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 153
LDI r2, 14
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

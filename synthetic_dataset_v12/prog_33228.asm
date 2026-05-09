; DESCRIPTION: Draws a white rectangle at (14, 153) with width 77 and height 21.
; PLAN: r0=14(x), r1=153(y), r2=77(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 153
LDI r2, 77
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

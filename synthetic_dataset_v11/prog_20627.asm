; DESCRIPTION: Draws a white rectangle at (72, 153) with width 86 and height 73.
; PLAN: r0=72(x), r1=153(y), r2=86(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 153
LDI r2, 86
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white rectangle at (381, 16) with width 92 and height 103.
; PLAN: r0=381(x), r1=16(y), r2=92(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 16
LDI r2, 92
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

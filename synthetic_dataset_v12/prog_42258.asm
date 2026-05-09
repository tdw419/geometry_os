; DESCRIPTION: Draws a white rectangle at (202, 136) with width 56 and height 32.
; PLAN: r0=202(x), r1=136(y), r2=56(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 136
LDI r2, 56
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a white rectangle at (418, 140) with width 32 and height 77.
; PLAN: r0=418(x), r1=140(y), r2=32(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 140
LDI r2, 32
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

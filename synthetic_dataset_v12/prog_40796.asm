; DESCRIPTION: Draws a white rectangle at (346, 81) with width 19 and height 48.
; PLAN: r0=346(x), r1=81(y), r2=19(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 81
LDI r2, 19
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

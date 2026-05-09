; DESCRIPTION: Draws a white rectangle at (236, 61) with width 16 and height 119.
; PLAN: r0=236(x), r1=61(y), r2=16(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 61
LDI r2, 16
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

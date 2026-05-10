; DESCRIPTION: Draws a white rectangle at (142, 120) with width 22 and height 87.
; PLAN: r0=142(x), r1=120(y), r2=22(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 120
LDI r2, 22
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

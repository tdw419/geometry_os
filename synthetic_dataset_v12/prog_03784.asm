; DESCRIPTION: Draws a white rectangle at (120, 57) with width 20 and height 77.
; PLAN: r0=120(x), r1=57(y), r2=20(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 57
LDI r2, 20
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

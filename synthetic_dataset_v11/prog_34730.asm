; DESCRIPTION: Draws a white rectangle at (92, 77) with width 120 and height 99.
; PLAN: r0=92(x), r1=77(y), r2=120(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 77
LDI r2, 120
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

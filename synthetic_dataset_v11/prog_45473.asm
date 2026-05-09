; DESCRIPTION: Draws a white rectangle at (61, 18) with width 77 and height 34.
; PLAN: r0=61(x), r1=18(y), r2=77(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 18
LDI r2, 77
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

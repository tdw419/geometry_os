; DESCRIPTION: Draws a white rectangle at (132, 68) with width 77 and height 61.
; PLAN: r0=132(x), r1=68(y), r2=77(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 68
LDI r2, 77
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

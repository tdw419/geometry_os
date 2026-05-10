; DESCRIPTION: Renders a white box of size 97x77 starting at (20, 145).
; PLAN: r0=20(x), r1=145(y), r2=97(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 145
LDI r2, 97
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

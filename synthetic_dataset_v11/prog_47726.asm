; DESCRIPTION: Renders a white box of size 22x77 starting at (110, 122).
; PLAN: r0=110(x), r1=122(y), r2=22(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 122
LDI r2, 22
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

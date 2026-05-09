; DESCRIPTION: Renders a white box of size 110x77 starting at (313, 63).
; PLAN: r0=313(x), r1=63(y), r2=110(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 63
LDI r2, 110
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

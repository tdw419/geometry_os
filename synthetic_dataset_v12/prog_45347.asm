; DESCRIPTION: Renders a white box of size 105x31 starting at (57, 9).
; PLAN: r0=57(x), r1=9(y), r2=105(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 9
LDI r2, 105
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 17x105 starting at (47, 33).
; PLAN: r0=47(x), r1=33(y), r2=17(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 33
LDI r2, 17
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

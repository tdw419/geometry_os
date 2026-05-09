; DESCRIPTION: Renders a white box of size 80x11 starting at (44, 105).
; PLAN: r0=44(x), r1=105(y), r2=80(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 105
LDI r2, 80
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

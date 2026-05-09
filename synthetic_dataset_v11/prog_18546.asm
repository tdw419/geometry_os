; DESCRIPTION: Renders a white box of size 119x16 starting at (105, 52).
; PLAN: r0=105(x), r1=52(y), r2=119(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 52
LDI r2, 119
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

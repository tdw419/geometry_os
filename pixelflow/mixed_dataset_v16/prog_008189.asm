; DESCRIPTION: Renders a white box of size 89x40 starting at (258, 56).
; PLAN: r0=258(x), r1=56(y), r2=89(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 56
LDI r2, 89
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 77x80 starting at (258, 107).
; PLAN: r0=258(x), r1=107(y), r2=77(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 107
LDI r2, 77
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

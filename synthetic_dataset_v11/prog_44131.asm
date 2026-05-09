; DESCRIPTION: Renders a white box of size 77x65 starting at (99, 37).
; PLAN: r0=99(x), r1=37(y), r2=77(width), r3=65(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 37
LDI r2, 77
LDI r3, 65
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

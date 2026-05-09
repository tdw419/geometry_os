; DESCRIPTION: Renders a white box of size 77x57 starting at (133, 37).
; PLAN: r0=133(x), r1=37(y), r2=77(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 37
LDI r2, 77
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

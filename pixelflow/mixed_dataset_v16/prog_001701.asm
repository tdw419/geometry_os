; DESCRIPTION: Renders a white box of size 33x117 starting at (457, 77).
; PLAN: r0=457(x), r1=77(y), r2=33(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 77
LDI r2, 33
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a white box of size 77x39 starting at (202, 145).
; PLAN: r0=202(x), r1=145(y), r2=77(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 145
LDI r2, 77
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

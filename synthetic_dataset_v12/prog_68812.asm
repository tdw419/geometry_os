; DESCRIPTION: Renders a white box of size 68x102 starting at (89, 107).
; PLAN: r0=89(x), r1=107(y), r2=68(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 107
LDI r2, 68
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

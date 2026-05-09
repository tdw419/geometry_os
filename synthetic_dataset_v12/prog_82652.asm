; DESCRIPTION: Renders a white box of size 51x22 starting at (93, 192).
; PLAN: r0=93(x), r1=192(y), r2=51(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 192
LDI r2, 51
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

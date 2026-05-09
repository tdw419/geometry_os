; DESCRIPTION: Renders a white box of size 51x11 starting at (83, 115).
; PLAN: r0=83(x), r1=115(y), r2=51(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 115
LDI r2, 51
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

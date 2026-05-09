; DESCRIPTION: Places a red 77x83 rectangle at position (83, 112).
; PLAN: r0=83(x), r1=112(y), r2=77(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 112
LDI r2, 77
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

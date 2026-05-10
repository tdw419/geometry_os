; DESCRIPTION: Places a red 77x76 box at position (145, 170).
; PLAN: r0=145(x), r1=170(y), r2=77(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 170
LDI r2, 77
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

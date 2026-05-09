; DESCRIPTION: Places a orange 119x77 rectangle at position (297, 51).
; PLAN: r0=297(x), r1=51(y), r2=119(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 51
LDI r2, 119
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

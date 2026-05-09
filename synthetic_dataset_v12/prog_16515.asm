; DESCRIPTION: Places a orange 51x112 rectangle at position (83, 85).
; PLAN: r0=83(x), r1=85(y), r2=51(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 85
LDI r2, 51
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

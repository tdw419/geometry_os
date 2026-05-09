; DESCRIPTION: Places a orange 19x44 rectangle at position (77, 51).
; PLAN: r0=77(x), r1=51(y), r2=19(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 51
LDI r2, 19
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

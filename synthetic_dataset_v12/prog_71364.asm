; DESCRIPTION: Places a white 116x51 rectangle at position (334, 87).
; PLAN: r0=334(x), r1=87(y), r2=116(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 87
LDI r2, 116
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

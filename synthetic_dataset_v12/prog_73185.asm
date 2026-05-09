; DESCRIPTION: Places a white 15x51 rectangle at position (83, 197).
; PLAN: r0=83(x), r1=197(y), r2=15(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 197
LDI r2, 15
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white 110x51 rectangle at position (64, 45).
; PLAN: r0=64(x), r1=45(y), r2=110(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 45
LDI r2, 110
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

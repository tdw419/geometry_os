; DESCRIPTION: Places a white 49x51 rectangle at position (226, 45).
; PLAN: r0=226(x), r1=45(y), r2=49(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 45
LDI r2, 49
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

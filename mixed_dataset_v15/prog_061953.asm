; DESCRIPTION: Places a blue 77x73 rectangle at position (258, 51).
; PLAN: r0=258(x), r1=51(y), r2=77(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 51
LDI r2, 77
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

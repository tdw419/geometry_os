; DESCRIPTION: Places a black 110x51 rectangle at position (107, 164).
; PLAN: r0=107(x), r1=164(y), r2=110(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 164
LDI r2, 110
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

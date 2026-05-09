; DESCRIPTION: Places a orange 110x32 rectangle at position (51, 105).
; PLAN: r0=51(x), r1=105(y), r2=110(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 105
LDI r2, 110
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

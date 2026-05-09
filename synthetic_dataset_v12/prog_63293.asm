; DESCRIPTION: Places a orange 105x51 rectangle at position (286, 89).
; PLAN: r0=286(x), r1=89(y), r2=105(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 89
LDI r2, 105
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

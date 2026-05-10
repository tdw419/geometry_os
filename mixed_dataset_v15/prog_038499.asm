; DESCRIPTION: Places a orange 105x51 rectangle at position (120, 33).
; PLAN: r0=120(x), r1=33(y), r2=105(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 33
LDI r2, 105
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

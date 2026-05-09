; DESCRIPTION: Places a orange 47x51 rectangle at position (193, 85).
; PLAN: r0=193(x), r1=85(y), r2=47(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 85
LDI r2, 47
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

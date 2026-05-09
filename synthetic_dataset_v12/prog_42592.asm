; DESCRIPTION: Places a orange 96x83 rectangle at position (162, 51).
; PLAN: r0=162(x), r1=51(y), r2=96(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 51
LDI r2, 96
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

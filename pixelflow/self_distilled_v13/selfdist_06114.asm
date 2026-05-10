; DESCRIPTION: Places a orange 105x10 box at position (305, 124).
; PLAN: r0=305(x), r1=124(y), r2=105(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 124
LDI r2, 105
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

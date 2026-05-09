; DESCRIPTION: Places a orange 100x47 rectangle at position (87, 149).
; PLAN: r0=87(x), r1=149(y), r2=100(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 149
LDI r2, 100
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

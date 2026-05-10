; DESCRIPTION: Places a orange 21x93 box at position (305, 81).
; PLAN: r0=305(x), r1=81(y), r2=21(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 81
LDI r2, 21
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

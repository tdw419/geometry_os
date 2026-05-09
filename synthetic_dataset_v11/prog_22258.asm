; DESCRIPTION: Places a orange 71x57 rectangle at position (115, 80).
; PLAN: r0=115(x), r1=80(y), r2=71(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 80
LDI r2, 71
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

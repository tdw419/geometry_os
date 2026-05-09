; DESCRIPTION: Places a black 83x77 rectangle at position (99, 76).
; PLAN: r0=99(x), r1=76(y), r2=83(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 76
LDI r2, 83
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

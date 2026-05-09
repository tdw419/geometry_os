; DESCRIPTION: Places a black 31x77 rectangle at position (434, 89).
; PLAN: r0=434(x), r1=89(y), r2=31(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 89
LDI r2, 31
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

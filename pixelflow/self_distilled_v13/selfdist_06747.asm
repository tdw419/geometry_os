; DESCRIPTION: Creates a white filled rectangle of size 93x55 starting at (325, 89).
; PLAN: r0=325(x), r1=89(y), r2=93(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 89
LDI r2, 93
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

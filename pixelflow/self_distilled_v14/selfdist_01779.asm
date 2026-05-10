; DESCRIPTION: Creates a white filled rectangle of size 89x36 starting at (366, 82).
; PLAN: r0=366(x), r1=82(y), r2=89(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 82
LDI r2, 89
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

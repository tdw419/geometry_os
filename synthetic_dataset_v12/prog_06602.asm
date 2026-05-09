; DESCRIPTION: Places a cyan 119x89 rectangle at position (102, 4).
; PLAN: r0=102(x), r1=4(y), r2=119(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 4
LDI r2, 119
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

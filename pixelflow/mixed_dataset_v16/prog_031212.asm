; DESCRIPTION: Places a cyan 115x89 rectangle at position (379, 93).
; PLAN: r0=379(x), r1=93(y), r2=115(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 93
LDI r2, 115
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

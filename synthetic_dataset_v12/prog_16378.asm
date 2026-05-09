; DESCRIPTION: Places a cyan 118x83 rectangle at position (140, 61).
; PLAN: r0=140(x), r1=61(y), r2=118(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 61
LDI r2, 118
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

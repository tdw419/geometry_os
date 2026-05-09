; DESCRIPTION: Places a cyan 37x89 rectangle at position (141, 136).
; PLAN: r0=141(x), r1=136(y), r2=37(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 136
LDI r2, 37
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

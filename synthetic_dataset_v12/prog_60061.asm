; DESCRIPTION: Places a cyan 89x71 rectangle at position (248, 2).
; PLAN: r0=248(x), r1=2(y), r2=89(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 2
LDI r2, 89
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

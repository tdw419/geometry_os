; DESCRIPTION: Places a cyan 45x74 box at position (193, 156).
; PLAN: r0=193(x), r1=156(y), r2=45(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 156
LDI r2, 45
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

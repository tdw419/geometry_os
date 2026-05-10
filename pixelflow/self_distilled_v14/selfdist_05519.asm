; DESCRIPTION: Places a cyan 10x61 box at position (26, 139).
; PLAN: r0=26(x), r1=139(y), r2=10(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 139
LDI r2, 10
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

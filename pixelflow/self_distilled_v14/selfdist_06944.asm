; DESCRIPTION: Places a cyan 76x58 box at position (3, 60).
; PLAN: r0=3(x), r1=60(y), r2=76(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 60
LDI r2, 76
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

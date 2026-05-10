; DESCRIPTION: Places a cyan 10x93 box at position (23, 40).
; PLAN: r0=23(x), r1=40(y), r2=10(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 40
LDI r2, 10
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

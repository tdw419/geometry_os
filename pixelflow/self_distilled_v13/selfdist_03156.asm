; DESCRIPTION: Places a cyan 105x72 box at position (75, 23).
; PLAN: r0=75(x), r1=23(y), r2=105(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 23
LDI r2, 105
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

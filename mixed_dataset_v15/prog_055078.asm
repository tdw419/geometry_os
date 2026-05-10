; DESCRIPTION: Places a cyan 79x21 box at position (314, 100).
; PLAN: r0=314(x), r1=100(y), r2=79(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 100
LDI r2, 79
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

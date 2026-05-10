; DESCRIPTION: Places a cyan 87x16 box at position (4, 110).
; PLAN: r0=4(x), r1=110(y), r2=87(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 110
LDI r2, 87
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

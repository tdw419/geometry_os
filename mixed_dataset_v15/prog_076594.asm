; DESCRIPTION: Places a cyan 79x13 box at position (372, 37).
; PLAN: r0=372(x), r1=37(y), r2=79(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 37
LDI r2, 79
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

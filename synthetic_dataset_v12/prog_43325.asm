; DESCRIPTION: Places a cyan 79x110 rectangle at position (278, 75).
; PLAN: r0=278(x), r1=75(y), r2=79(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 75
LDI r2, 79
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

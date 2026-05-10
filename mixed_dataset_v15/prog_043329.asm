; DESCRIPTION: Places a cyan 79x31 box at position (316, 135).
; PLAN: r0=316(x), r1=135(y), r2=79(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 135
LDI r2, 79
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

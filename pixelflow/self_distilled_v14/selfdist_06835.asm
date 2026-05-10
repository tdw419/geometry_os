; DESCRIPTION: Places a yellow 79x87 box at position (297, 167).
; PLAN: r0=297(x), r1=167(y), r2=79(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 167
LDI r2, 79
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

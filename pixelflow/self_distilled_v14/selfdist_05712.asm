; DESCRIPTION: Places a green 13x79 box at position (269, 34).
; PLAN: r0=269(x), r1=34(y), r2=13(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 34
LDI r2, 13
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

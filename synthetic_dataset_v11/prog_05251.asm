; DESCRIPTION: Places a green 115x79 rectangle at position (87, 87).
; PLAN: r0=87(x), r1=87(y), r2=115(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 87
LDI r2, 115
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green 64x79 rectangle at position (366, 51).
; PLAN: r0=366(x), r1=51(y), r2=64(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 51
LDI r2, 64
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

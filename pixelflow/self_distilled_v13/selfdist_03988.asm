; DESCRIPTION: Places a cyan 21x51 box at position (157, 10).
; PLAN: r0=157(x), r1=10(y), r2=21(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 10
LDI r2, 21
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

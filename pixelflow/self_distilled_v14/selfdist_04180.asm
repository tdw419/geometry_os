; DESCRIPTION: Places a cyan 63x57 box at position (22, 1).
; PLAN: r0=22(x), r1=1(y), r2=63(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 1
LDI r2, 63
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT

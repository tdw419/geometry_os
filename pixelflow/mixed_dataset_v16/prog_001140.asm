; DESCRIPTION: Places a yellow 84x94 box at position (321, 36).
; PLAN: r0=321(x), r1=36(y), r2=84(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 36
LDI r2, 84
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

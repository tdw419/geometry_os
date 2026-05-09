; DESCRIPTION: Draws a white line from (137, 64) to (449, 99).
; PLAN: r0=137(x1), r1=64(y1), r2=449(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 64
LDI r2, 449
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

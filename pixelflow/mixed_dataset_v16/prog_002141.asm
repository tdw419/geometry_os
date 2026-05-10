; DESCRIPTION: Draws a yellow line from (445, 179) to (83, 128).
; PLAN: r0=445(x1), r1=179(y1), r2=83(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 179
LDI r2, 83
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

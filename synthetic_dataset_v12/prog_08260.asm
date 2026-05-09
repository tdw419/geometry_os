; DESCRIPTION: Draws a yellow line from (23, 31) to (32, 127).
; PLAN: r0=23(x1), r1=31(y1), r2=32(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 31
LDI r2, 32
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

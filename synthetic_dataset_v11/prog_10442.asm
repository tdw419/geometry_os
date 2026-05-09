; DESCRIPTION: Draws a yellow line from (6, 32) to (139, 86).
; PLAN: r0=6(x1), r1=32(y1), r2=139(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 32
LDI r2, 139
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

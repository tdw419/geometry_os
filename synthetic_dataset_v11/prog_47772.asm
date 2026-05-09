; DESCRIPTION: Draws a yellow line from (241, 66) to (90, 32).
; PLAN: r0=241(x1), r1=66(y1), r2=90(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 66
LDI r2, 90
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

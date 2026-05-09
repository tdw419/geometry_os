; DESCRIPTION: Draws a yellow line from (23, 197) to (83, 49).
; PLAN: r0=23(x1), r1=197(y1), r2=83(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 197
LDI r2, 83
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

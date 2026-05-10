; DESCRIPTION: Draws a yellow line from (61, 60) to (94, 47).
; PLAN: r0=61(x1), r1=60(y1), r2=94(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 60
LDI r2, 94
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

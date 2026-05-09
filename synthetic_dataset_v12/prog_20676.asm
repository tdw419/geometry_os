; DESCRIPTION: Draws a yellow line from (84, 169) to (445, 23).
; PLAN: r0=84(x1), r1=169(y1), r2=445(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 169
LDI r2, 445
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

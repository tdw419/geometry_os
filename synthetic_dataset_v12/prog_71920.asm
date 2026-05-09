; DESCRIPTION: Draws a green line from (177, 70) to (73, 23).
; PLAN: r0=177(x1), r1=70(y1), r2=73(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 70
LDI r2, 73
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

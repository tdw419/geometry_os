; DESCRIPTION: Draws a yellow line from (73, 31) to (311, 231).
; PLAN: r0=73(x1), r1=31(y1), r2=311(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 31
LDI r2, 311
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

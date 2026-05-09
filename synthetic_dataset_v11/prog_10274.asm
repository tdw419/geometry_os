; DESCRIPTION: Draws a black line from (179, 231) to (23, 208).
; PLAN: r0=179(x1), r1=231(y1), r2=23(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 231
LDI r2, 23
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

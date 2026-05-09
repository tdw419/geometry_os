; DESCRIPTION: Draws a white line from (170, 231) to (56, 229).
; PLAN: r0=170(x1), r1=231(y1), r2=56(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 231
LDI r2, 56
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

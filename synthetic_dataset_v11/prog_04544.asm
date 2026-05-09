; DESCRIPTION: Draws a yellow line from (234, 229) to (60, 10).
; PLAN: r0=234(x1), r1=229(y1), r2=60(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 229
LDI r2, 60
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

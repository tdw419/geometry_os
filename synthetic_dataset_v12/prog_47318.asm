; DESCRIPTION: Draws a yellow line from (387, 61) to (212, 191).
; PLAN: r0=387(x1), r1=61(y1), r2=212(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 61
LDI r2, 212
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

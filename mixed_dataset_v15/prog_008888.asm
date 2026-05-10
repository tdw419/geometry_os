; DESCRIPTION: Draws a yellow line from (98, 39) to (349, 229).
; PLAN: r0=98(x1), r1=39(y1), r2=349(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 39
LDI r2, 349
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

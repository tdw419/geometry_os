; DESCRIPTION: Draws a yellow line from (305, 229) to (361, 51).
; PLAN: r0=305(x1), r1=229(y1), r2=361(x2), r3=51(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 229
LDI r2, 361
LDI r3, 51
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

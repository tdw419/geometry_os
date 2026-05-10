; DESCRIPTION: Draws a yellow line from (429, 249) to (279, 89).
; PLAN: r0=429(x1), r1=249(y1), r2=279(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 249
LDI r2, 279
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

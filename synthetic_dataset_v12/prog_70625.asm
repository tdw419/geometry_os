; DESCRIPTION: Draws a green line from (321, 92) to (230, 141).
; PLAN: r0=321(x1), r1=92(y1), r2=230(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 92
LDI r2, 230
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

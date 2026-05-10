; DESCRIPTION: Draws a yellow line from (266, 230) to (449, 71).
; PLAN: r0=266(x1), r1=230(y1), r2=449(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 230
LDI r2, 449
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

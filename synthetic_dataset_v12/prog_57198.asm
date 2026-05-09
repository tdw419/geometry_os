; DESCRIPTION: Draws a yellow line from (504, 18) to (458, 221).
; PLAN: r0=504(x1), r1=18(y1), r2=458(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 18
LDI r2, 458
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (462, 13) to (279, 31).
; PLAN: r0=462(x1), r1=13(y1), r2=279(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 13
LDI r2, 279
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (89, 13) to (46, 26).
; PLAN: r0=89(x1), r1=13(y1), r2=46(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 13
LDI r2, 46
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

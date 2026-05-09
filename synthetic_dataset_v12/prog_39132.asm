; DESCRIPTION: Draws a black line from (98, 34) to (465, 234).
; PLAN: r0=98(x1), r1=34(y1), r2=465(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 34
LDI r2, 465
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

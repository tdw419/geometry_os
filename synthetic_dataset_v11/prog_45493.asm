; DESCRIPTION: Draws a black line from (36, 13) to (123, 91).
; PLAN: r0=36(x1), r1=13(y1), r2=123(x2), r3=91(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 13
LDI r2, 123
LDI r3, 91
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

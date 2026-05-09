; DESCRIPTION: Draws a black line from (126, 187) to (77, 18).
; PLAN: r0=126(x1), r1=187(y1), r2=77(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 187
LDI r2, 77
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (186, 107) to (9, 150).
; PLAN: r0=186(x1), r1=107(y1), r2=9(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 107
LDI r2, 9
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

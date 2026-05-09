; DESCRIPTION: Draws a black line from (185, 150) to (177, 117).
; PLAN: r0=185(x1), r1=150(y1), r2=177(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 150
LDI r2, 177
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

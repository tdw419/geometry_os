; DESCRIPTION: Draws a black line from (65, 249) to (145, 205).
; PLAN: r0=65(x1), r1=249(y1), r2=145(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 249
LDI r2, 145
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

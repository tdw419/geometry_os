; DESCRIPTION: Draws a black line from (192, 120) to (185, 236).
; PLAN: r0=192(x1), r1=120(y1), r2=185(x2), r3=236(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 120
LDI r2, 185
LDI r3, 236
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

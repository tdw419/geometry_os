; DESCRIPTION: Draws a black line from (225, 179) to (0, 221).
; PLAN: r0=225(x1), r1=179(y1), r2=0(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 179
LDI r2, 0
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

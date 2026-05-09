; DESCRIPTION: Draws a black line from (177, 59) to (186, 206).
; PLAN: r0=177(x1), r1=59(y1), r2=186(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 59
LDI r2, 186
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (186, 44) to (21, 121).
; PLAN: r0=186(x1), r1=44(y1), r2=21(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 44
LDI r2, 21
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

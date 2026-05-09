; DESCRIPTION: Draws a black line from (38, 151) to (177, 241).
; PLAN: r0=38(x1), r1=151(y1), r2=177(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 151
LDI r2, 177
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

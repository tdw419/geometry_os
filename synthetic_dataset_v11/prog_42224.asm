; DESCRIPTION: Draws a black line from (116, 57) to (221, 195).
; PLAN: r0=116(x1), r1=57(y1), r2=221(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 57
LDI r2, 221
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

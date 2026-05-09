; DESCRIPTION: Draws a black line from (209, 7) to (221, 143).
; PLAN: r0=209(x1), r1=7(y1), r2=221(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 7
LDI r2, 221
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

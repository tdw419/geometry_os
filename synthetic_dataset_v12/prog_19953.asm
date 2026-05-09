; DESCRIPTION: Draws a black line from (236, 160) to (400, 57).
; PLAN: r0=236(x1), r1=160(y1), r2=400(x2), r3=57(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 160
LDI r2, 400
LDI r3, 57
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black line from (160, 64) to (186, 194).
; PLAN: r0=160(x1), r1=64(y1), r2=186(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 64
LDI r2, 186
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

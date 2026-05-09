; DESCRIPTION: Draws a black line from (403, 73) to (136, 107).
; PLAN: r0=403(x1), r1=73(y1), r2=136(x2), r3=107(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 73
LDI r2, 136
LDI r3, 107
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

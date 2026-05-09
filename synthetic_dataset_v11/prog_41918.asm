; DESCRIPTION: Draws a black line from (32, 202) to (112, 237).
; PLAN: r0=32(x1), r1=202(y1), r2=112(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 202
LDI r2, 112
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

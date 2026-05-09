; DESCRIPTION: Renders a black line between points (368, 144) and (271, 121).
; PLAN: r0=368(x1), r1=144(y1), r2=271(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 144
LDI r2, 271
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

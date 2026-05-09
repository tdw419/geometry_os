; DESCRIPTION: Renders a black line between points (271, 128) and (484, 46).
; PLAN: r0=271(x1), r1=128(y1), r2=484(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 128
LDI r2, 484
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

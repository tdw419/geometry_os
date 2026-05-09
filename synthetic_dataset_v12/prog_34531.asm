; DESCRIPTION: Renders a green line between points (469, 1) and (141, 219).
; PLAN: r0=469(x1), r1=1(y1), r2=141(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 1
LDI r2, 141
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

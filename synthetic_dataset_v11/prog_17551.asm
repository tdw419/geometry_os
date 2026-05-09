; DESCRIPTION: Places a black line segment connecting (90, 155) to (121, 42).
; PLAN: r0=90(x1), r1=155(y1), r2=121(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 155
LDI r2, 121
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

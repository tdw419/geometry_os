; DESCRIPTION: Places a black line segment connecting (73, 129) to (25, 81).
; PLAN: r0=73(x1), r1=129(y1), r2=25(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 129
LDI r2, 25
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

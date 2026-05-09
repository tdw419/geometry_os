; DESCRIPTION: Places a black line segment connecting (327, 49) to (241, 143).
; PLAN: r0=327(x1), r1=49(y1), r2=241(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 49
LDI r2, 241
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

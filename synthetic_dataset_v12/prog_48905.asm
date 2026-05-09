; DESCRIPTION: Places a black line segment connecting (273, 221) to (3, 193).
; PLAN: r0=273(x1), r1=221(y1), r2=3(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 221
LDI r2, 3
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black line segment connecting (65, 221) to (237, 90).
; PLAN: r0=65(x1), r1=221(y1), r2=237(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 221
LDI r2, 237
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

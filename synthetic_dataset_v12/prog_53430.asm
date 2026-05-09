; DESCRIPTION: Places a black line segment connecting (193, 212) to (494, 65).
; PLAN: r0=193(x1), r1=212(y1), r2=494(x2), r3=65(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 212
LDI r2, 494
LDI r3, 65
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

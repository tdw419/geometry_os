; DESCRIPTION: Places a cyan line segment connecting (286, 80) to (341, 217).
; PLAN: r0=286(x1), r1=80(y1), r2=341(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 80
LDI r2, 341
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

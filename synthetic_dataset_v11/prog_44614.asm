; DESCRIPTION: Places a black line segment connecting (59, 7) to (177, 21).
; PLAN: r0=59(x1), r1=7(y1), r2=177(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 7
LDI r2, 177
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

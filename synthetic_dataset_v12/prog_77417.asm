; DESCRIPTION: Places a black line segment connecting (391, 32) to (265, 124).
; PLAN: r0=391(x1), r1=32(y1), r2=265(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 32
LDI r2, 265
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

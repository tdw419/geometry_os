; DESCRIPTION: Places a yellow line segment connecting (255, 77) to (391, 71).
; PLAN: r0=255(x1), r1=77(y1), r2=391(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 77
LDI r2, 391
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

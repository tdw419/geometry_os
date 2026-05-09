; DESCRIPTION: Places a cyan line segment connecting (436, 10) to (391, 129).
; PLAN: r0=436(x1), r1=10(y1), r2=391(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 10
LDI r2, 391
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

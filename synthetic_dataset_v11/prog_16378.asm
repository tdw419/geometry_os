; DESCRIPTION: Places a green line segment connecting (75, 186) to (17, 7).
; PLAN: r0=75(x1), r1=186(y1), r2=17(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 186
LDI r2, 17
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

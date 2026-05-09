; DESCRIPTION: Draws a purple line from (242, 91) to (17, 131).
; PLAN: r0=242(x1), r1=91(y1), r2=17(x2), r3=131(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 91
LDI r2, 17
LDI r3, 131
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

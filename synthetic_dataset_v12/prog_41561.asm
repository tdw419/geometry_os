; DESCRIPTION: Draws a green line from (7, 3) to (325, 242).
; PLAN: r0=7(x1), r1=3(y1), r2=325(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 3
LDI r2, 325
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

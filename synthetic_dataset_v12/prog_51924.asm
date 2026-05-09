; DESCRIPTION: Places a yellow line segment connecting (325, 236) to (162, 215).
; PLAN: r0=325(x1), r1=236(y1), r2=162(x2), r3=215(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 236
LDI r2, 162
LDI r3, 215
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a green line from (325, 150) to (454, 178).
; PLAN: r0=325(x1), r1=150(y1), r2=454(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 150
LDI r2, 454
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

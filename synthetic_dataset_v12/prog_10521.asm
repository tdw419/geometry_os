; DESCRIPTION: Draws a yellow line from (51, 44) to (393, 224).
; PLAN: r0=51(x1), r1=44(y1), r2=393(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 44
LDI r2, 393
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

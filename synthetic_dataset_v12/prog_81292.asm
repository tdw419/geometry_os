; DESCRIPTION: Draws a green line from (341, 107) to (234, 137).
; PLAN: r0=341(x1), r1=107(y1), r2=234(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 107
LDI r2, 234
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (249, 214) to (26, 143).
; PLAN: r0=249(x1), r1=214(y1), r2=26(x2), r3=143(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 214
LDI r2, 26
LDI r3, 143
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

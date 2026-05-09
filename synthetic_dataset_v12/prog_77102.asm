; DESCRIPTION: Places a yellow line segment connecting (168, 107) to (251, 13).
; PLAN: r0=168(x1), r1=107(y1), r2=251(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 107
LDI r2, 251
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

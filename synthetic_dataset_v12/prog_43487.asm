; DESCRIPTION: Places a green line segment connecting (147, 58) to (60, 27).
; PLAN: r0=147(x1), r1=58(y1), r2=60(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 58
LDI r2, 60
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a yellow line segment connecting (189, 66) to (394, 167).
; PLAN: r0=189(x1), r1=66(y1), r2=394(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 66
LDI r2, 394
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

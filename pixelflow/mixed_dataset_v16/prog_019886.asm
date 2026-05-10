; DESCRIPTION: Places a yellow line segment connecting (229, 154) to (71, 202).
; PLAN: r0=229(x1), r1=154(y1), r2=71(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 154
LDI r2, 71
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a red line segment connecting (242, 216) to (189, 193).
; PLAN: r0=242(x1), r1=216(y1), r2=189(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 216
LDI r2, 189
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green line segment connecting (242, 109) to (449, 22).
; PLAN: r0=242(x1), r1=109(y1), r2=449(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 109
LDI r2, 449
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

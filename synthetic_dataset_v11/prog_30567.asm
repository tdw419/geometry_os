; DESCRIPTION: Places a black line segment connecting (192, 242) to (115, 12).
; PLAN: r0=192(x1), r1=242(y1), r2=115(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 242
LDI r2, 115
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT

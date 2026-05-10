; DESCRIPTION: Places a yellow line segment connecting (483, 135) to (242, 192).
; PLAN: r0=483(x1), r1=135(y1), r2=242(x2), r3=192(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 135
LDI r2, 242
LDI r3, 192
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

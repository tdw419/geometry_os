; DESCRIPTION: Places a yellow line segment connecting (242, 14) to (398, 3).
; PLAN: r0=242(x1), r1=14(y1), r2=398(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 14
LDI r2, 398
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

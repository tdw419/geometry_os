; DESCRIPTION: Places a green line segment connecting (28, 94) to (141, 242).
; PLAN: r0=28(x1), r1=94(y1), r2=141(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 94
LDI r2, 141
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

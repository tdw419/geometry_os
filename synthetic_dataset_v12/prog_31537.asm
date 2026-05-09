; DESCRIPTION: Places a green line segment connecting (242, 26) to (302, 114).
; PLAN: r0=242(x1), r1=26(y1), r2=302(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 26
LDI r2, 302
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

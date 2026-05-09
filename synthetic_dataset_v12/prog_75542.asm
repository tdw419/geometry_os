; DESCRIPTION: Places a green line segment connecting (242, 252) to (266, 46).
; PLAN: r0=242(x1), r1=252(y1), r2=266(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 252
LDI r2, 266
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

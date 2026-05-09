; DESCRIPTION: Places a green line segment connecting (133, 242) to (203, 71).
; PLAN: r0=133(x1), r1=242(y1), r2=203(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 242
LDI r2, 203
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green line segment connecting (242, 92) to (226, 133).
; PLAN: r0=242(x1), r1=92(y1), r2=226(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 92
LDI r2, 226
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

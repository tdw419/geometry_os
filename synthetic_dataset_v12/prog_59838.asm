; DESCRIPTION: Places a white line segment connecting (178, 131) to (242, 149).
; PLAN: r0=178(x1), r1=131(y1), r2=242(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 131
LDI r2, 242
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

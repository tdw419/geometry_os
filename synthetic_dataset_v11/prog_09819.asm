; DESCRIPTION: Places a green line segment connecting (61, 179) to (242, 218).
; PLAN: r0=61(x1), r1=179(y1), r2=242(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 179
LDI r2, 242
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

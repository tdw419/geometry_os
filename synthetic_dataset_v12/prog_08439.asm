; DESCRIPTION: Places a green line segment connecting (466, 72) to (305, 64).
; PLAN: r0=466(x1), r1=72(y1), r2=305(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 72
LDI r2, 305
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

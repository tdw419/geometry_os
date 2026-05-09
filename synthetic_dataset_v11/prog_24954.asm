; DESCRIPTION: Places a green line segment connecting (64, 160) to (18, 177).
; PLAN: r0=64(x1), r1=160(y1), r2=18(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 160
LDI r2, 18
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green line segment connecting (236, 16) to (449, 223).
; PLAN: r0=236(x1), r1=16(y1), r2=449(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 16
LDI r2, 449
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

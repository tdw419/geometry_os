; DESCRIPTION: Places a green line segment connecting (64, 128) to (148, 91).
; PLAN: r0=64(x1), r1=128(y1), r2=148(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 128
LDI r2, 148
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

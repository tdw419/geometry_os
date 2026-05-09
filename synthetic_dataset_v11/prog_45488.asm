; DESCRIPTION: Places a green line segment connecting (148, 209) to (128, 64).
; PLAN: r0=148(x1), r1=209(y1), r2=128(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 209
LDI r2, 128
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

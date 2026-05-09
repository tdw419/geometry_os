; DESCRIPTION: Places a green line segment connecting (148, 126) to (64, 240).
; PLAN: r0=148(x1), r1=126(y1), r2=64(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 126
LDI r2, 64
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

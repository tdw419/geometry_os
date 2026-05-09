; DESCRIPTION: Places a green line segment connecting (3, 42) to (250, 221).
; PLAN: r0=3(x1), r1=42(y1), r2=250(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 42
LDI r2, 250
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

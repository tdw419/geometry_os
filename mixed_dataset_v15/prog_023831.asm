; DESCRIPTION: Places a green line segment connecting (189, 55) to (450, 64).
; PLAN: r0=189(x1), r1=55(y1), r2=450(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 55
LDI r2, 450
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a cyan line segment connecting (100, 219) to (189, 82).
; PLAN: r0=100(x1), r1=219(y1), r2=189(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 219
LDI r2, 189
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT

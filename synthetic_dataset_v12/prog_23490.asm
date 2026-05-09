; DESCRIPTION: Places a green line segment connecting (463, 53) to (389, 42).
; PLAN: r0=463(x1), r1=53(y1), r2=389(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 53
LDI r2, 389
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

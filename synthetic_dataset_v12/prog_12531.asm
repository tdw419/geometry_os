; DESCRIPTION: Places a green line segment connecting (27, 87) to (386, 133).
; PLAN: r0=27(x1), r1=87(y1), r2=386(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 87
LDI r2, 386
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

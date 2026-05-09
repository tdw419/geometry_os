; DESCRIPTION: Places a green line segment connecting (16, 150) to (23, 184).
; PLAN: r0=16(x1), r1=150(y1), r2=23(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 150
LDI r2, 23
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

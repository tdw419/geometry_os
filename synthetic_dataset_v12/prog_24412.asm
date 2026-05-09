; DESCRIPTION: Places a white line segment connecting (273, 72) to (115, 128).
; PLAN: r0=273(x1), r1=72(y1), r2=115(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 72
LDI r2, 115
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a white line segment connecting (220, 26) to (64, 14).
; PLAN: r0=220(x1), r1=26(y1), r2=64(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 26
LDI r2, 64
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

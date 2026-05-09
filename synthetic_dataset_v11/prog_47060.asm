; DESCRIPTION: Places a green line segment connecting (10, 215) to (30, 26).
; PLAN: r0=10(x1), r1=215(y1), r2=30(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 215
LDI r2, 30
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a green line segment connecting (18, 191) to (66, 48).
; PLAN: r0=18(x1), r1=191(y1), r2=66(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 191
LDI r2, 66
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

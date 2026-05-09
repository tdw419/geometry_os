; DESCRIPTION: Renders a white line between points (130, 191) and (231, 64).
; PLAN: r0=130(x1), r1=191(y1), r2=231(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 191
LDI r2, 231
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

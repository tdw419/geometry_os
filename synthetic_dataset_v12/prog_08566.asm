; DESCRIPTION: Renders a green line between points (61, 191) and (442, 156).
; PLAN: r0=61(x1), r1=191(y1), r2=442(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 191
LDI r2, 442
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

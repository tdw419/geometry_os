; DESCRIPTION: Renders a white line between points (259, 191) and (305, 159).
; PLAN: r0=259(x1), r1=191(y1), r2=305(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 191
LDI r2, 305
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

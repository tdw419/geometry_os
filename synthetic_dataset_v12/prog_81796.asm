; DESCRIPTION: Renders a white line between points (94, 191) and (183, 231).
; PLAN: r0=94(x1), r1=191(y1), r2=183(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 191
LDI r2, 183
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

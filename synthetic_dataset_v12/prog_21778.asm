; DESCRIPTION: Renders a white line between points (271, 234) and (26, 216).
; PLAN: r0=271(x1), r1=234(y1), r2=26(x2), r3=216(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 234
LDI r2, 26
LDI r3, 216
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT

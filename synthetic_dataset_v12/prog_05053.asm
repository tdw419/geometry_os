; DESCRIPTION: Renders a green line between points (234, 13) and (71, 142).
; PLAN: r0=234(x1), r1=13(y1), r2=71(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 13
LDI r2, 71
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

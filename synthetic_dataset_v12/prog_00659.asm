; DESCRIPTION: Renders a green line between points (169, 149) and (46, 191).
; PLAN: r0=169(x1), r1=149(y1), r2=46(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 149
LDI r2, 46
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

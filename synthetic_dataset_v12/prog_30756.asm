; DESCRIPTION: Renders a green line between points (211, 212) and (46, 28).
; PLAN: r0=211(x1), r1=212(y1), r2=46(x2), r3=28(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 212
LDI r2, 46
LDI r3, 28
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

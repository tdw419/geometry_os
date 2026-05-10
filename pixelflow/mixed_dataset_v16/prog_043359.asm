; DESCRIPTION: Renders a green line between points (176, 144) and (279, 234).
; PLAN: r0=176(x1), r1=144(y1), r2=279(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 144
LDI r2, 279
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

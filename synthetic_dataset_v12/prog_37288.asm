; DESCRIPTION: Renders a green line between points (330, 128) and (114, 147).
; PLAN: r0=330(x1), r1=128(y1), r2=114(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 128
LDI r2, 114
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

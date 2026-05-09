; DESCRIPTION: Renders a green line between points (128, 196) and (46, 147).
; PLAN: r0=128(x1), r1=196(y1), r2=46(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 196
LDI r2, 46
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (431, 253) and (258, 40).
; PLAN: r0=431(x1), r1=253(y1), r2=258(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 253
LDI r2, 258
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

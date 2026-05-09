; DESCRIPTION: Renders a green line between points (160, 40) and (269, 248).
; PLAN: r0=160(x1), r1=40(y1), r2=269(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 40
LDI r2, 269
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

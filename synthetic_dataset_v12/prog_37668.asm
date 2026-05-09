; DESCRIPTION: Renders a purple line between points (221, 23) and (406, 248).
; PLAN: r0=221(x1), r1=23(y1), r2=406(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 23
LDI r2, 406
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT

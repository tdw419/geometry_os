; DESCRIPTION: Renders a green line between points (151, 154) and (364, 105).
; PLAN: r0=151(x1), r1=154(y1), r2=364(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 154
LDI r2, 364
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

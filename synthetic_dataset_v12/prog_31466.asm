; DESCRIPTION: Renders a green line between points (56, 195) and (248, 20).
; PLAN: r0=56(x1), r1=195(y1), r2=248(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 195
LDI r2, 248
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a green line between points (6, 128) and (153, 160).
; PLAN: r0=6(x1), r1=128(y1), r2=153(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 128
LDI r2, 153
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

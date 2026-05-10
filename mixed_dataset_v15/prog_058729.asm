; DESCRIPTION: Renders a green line between points (154, 185) and (142, 176).
; PLAN: r0=154(x1), r1=185(y1), r2=142(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 185
LDI r2, 142
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

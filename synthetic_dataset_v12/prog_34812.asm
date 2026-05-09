; DESCRIPTION: Renders a green line between points (227, 253) and (330, 65).
; PLAN: r0=227(x1), r1=253(y1), r2=330(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 253
LDI r2, 330
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

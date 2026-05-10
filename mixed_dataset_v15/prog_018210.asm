; DESCRIPTION: Renders a green line between points (189, 236) and (427, 21).
; PLAN: r0=189(x1), r1=236(y1), r2=427(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 236
LDI r2, 427
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT

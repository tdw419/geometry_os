; DESCRIPTION: Renders a yellow line between points (236, 237) and (37, 21).
; PLAN: r0=236(x1), r1=237(y1), r2=37(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 237
LDI r2, 37
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT

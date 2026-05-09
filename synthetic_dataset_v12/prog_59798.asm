; DESCRIPTION: Renders a yellow line between points (289, 38) and (242, 63).
; PLAN: r0=289(x1), r1=38(y1), r2=242(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 38
LDI r2, 242
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
